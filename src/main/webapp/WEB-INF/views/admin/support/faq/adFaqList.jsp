<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	function page() {
	    document.getElementById("FaqList").submit();
	}
</script>
<head>
<meta charset="UTF-8">
<title>adFaqList</title>
<link rel="stylesheet" href="${path}/resources/css/common/leftbar.css">
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@include file= "/WEB-INF/views/common/header.jsp"%>
		<!-- header 끝 -->
	      
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
				<!-- 상단 중앙1 시작 -->
				<div>
					<hr>
					<h1 align="center">FAQ 목록</h1>
					<hr>
				</div>
	            <!-- 상단 중앙1 종료 -->
	            
				<div id="section2">
					<div style="width:300px">
						<!-- 좌측 메뉴 시작 -->
						<%@ include file= "/WEB-INF/views/admin/common/adMainLeft.jsp" %>
						<!-- 좌측메뉴 종료 -->
					</div>
					<!-- FAQ 목록 시작 -->
					<form name ="FaqList" id="FaqList" action="${path}/adFaqList.ad" method="post" style="width:1300px">
						<table class="table" style="width:1050px; margin:auto;">
							<thead>
							    <tr>
									<th scope="col" style="width:8%; text-align:center;">번호</th>
							        <th scope="col" style="width:30%; text-align:center;">제목</th>
							        <th scope="col" style="width:15%; text-align:center;">작성자</th>
							        <th scope="col" style="width:15%; text-align:center;">날짜</th>
							        <th scope="col" style="width:10%; text-align:center;">
							        	<select  name="category" id="category" onchange="page()">
											<option value=""
												<c:if test="${category == '전체'}">selected="selected"</c:if>>FAQ타입</option>
											<option value="로그인관련"
												<c:if test="${category == '로그인관련'}">selected="selected"</c:if>>로그인/회원가입</option>
											<option value="예약관련"
												<c:if test="${category == '예약관련'}">selected="selected"</c:if>>예약</option>
											<option value="시설관련"
												<c:if test="${category == '시설관련'}">selected="selected"</c:if>>시설</option>
											<option value="결제관련"
												<c:if test="${category == '결제관련'}">selected="selected"</c:if>>결제 및 환불 정책</option>
											<option value="프로그램관련"
												<c:if test="${category == '프로그램관련'}">selected="selected"</c:if>>프로그램</option>
											<option value="안전관련"
												<c:if test="${category == '안전관련'}">selected="selected"</c:if>>건강 및 안전</option>
											<option value="기타"
												<c:if test="${category == '기타'}">selected="selected"</c:if>>기타</option>
										</select>
							        </th>
							        <th scope="col" style="width:13%; text-align:center;">삭제유무</th>
							        <th scope="col" style="width:10%; text-align:center;">복구</th>
							    </tr>
							</thead>
							<tbody>
								<c:forEach var="dto" items="${list}" >
									<tr>
										<th scope="row" style="text-align:center;">${dto.faqNo}</th>
								        <td style="text-align:left"><a href="${path}/adFaqDetailAction.ad?faqNo=${dto.faqNo}">${dto.faqTitle}</a></td>
								        <td>${dto.faqWriter}</td>
								        <td>${fn: substring(dto.faqRegDate,0,19)}</td>
								        <td>${dto.faqType}</td>
								        <td>${dto.faqShow}</td>
								        <td>
									        <c:if test="${dto.faqShow == 'N'}">
									        	<button type="button" class="btn active"onclick="window.location='${path}/adFaqRestore.ad?faqNo=${dto.faqNo}'">복구</button>
									        </c:if>
								        </td>
								    </tr>
								</c:forEach>
								<tr>
									<td colspan="5"></td>
									<td colspan="2" style="text-align:right">
										<button type="button" class="btn active"onclick="window.location='${path}/adFaqInsert.ad'">작성하기</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<!-- FAQ 목록 끝 -->
				</div>
				<hr>
			</div>
		</div>
	<!-- 컨텐츠 끝 -->
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>