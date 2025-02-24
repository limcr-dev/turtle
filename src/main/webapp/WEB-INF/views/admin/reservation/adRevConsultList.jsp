<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
function page() {
    document.getElementById("statusForm").submit();
}
</script>
<head>
<meta charset="UTF-8">
<title>adRevConsultList</title>
<link rel="stylesheet" href="${path}/resources/css/common/leftbar.css">
</head>
<body>
	<div class="wrap"> <!-- 스타일을 해주려고 class명을 지정함  -->
		<!-- header 시작 -->
		<%@include file= "/WEB-INF/views/common/header.jsp"%>
		<!-- header 끝 -->
	    
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
				<!-- 상단 중앙1 시작 -->
				<div>
					<hr>
					<h1 align="center">상담 예약 현황</h1>
					<hr>
				</div>
	            <!-- 상단 중앙1 종료 -->
	            
					<div id="section2">
						<!-- 좌측 메뉴 시작 -->               					
						<%@ include file= "/WEB-INF/views/admin/common/adMainLeft.jsp" %>
						<!-- 좌측메뉴 종료 -->
						
						<!-- 상담 예약 목록 시작 -->
						<form name ="statusForm" id="statusForm" action="${path}/adRevConsultList.ad" method="post" style="width:1300px">
							
							<table class="table" style="width:1050px; margin:auto;">
								<thead>
								    <tr align="center">
								      	<th scope="col" style="width:5%">번호</th>
								        <th scope="col" style="width:10%">아이디</th>
								        <th scope="col" style="width:10%">예약자</th>
								        <th scope="col" style="width:15%">전화번호</th>
								        <th scope="col" style="width:15%">예약일</th>
								        <th scope="col" style="width:10%">예약시간</th>
								        <th scope="col" style="width:10%">담당자</th>
								        <th scope="col" style="width:10%">
								        	<select name="statusType" id="listSize" onchange="page()">
												<option value=""
													<c:if test="${statusType == ''}">selected="selected"</c:if>>전체
												</option>
												<option value="대기"
													<c:if test="${statusType == '대기'}">selected="selected"</c:if>>대기
												</option>
												<option value="승인"
													<c:if test="${statusType == '승인'}">selected="selected"</c:if>>승인
												</option>
												<option value="완료"
													<c:if test="${statusType == '완료'}">selected="selected"</c:if>>완료
												</option>
												<option value="취소"
													<c:if test="${statusType == '취소'}">selected="selected"</c:if>>취소
												</option>
											</select>
								        </th>
								        <th scope="col" style="width:15%">상태 변경</th>
								    </tr>
								</thead>
								<tbody>
									<c:if test="${paging.count == 0}">
										<tr>
											<td colspan="8" align="center">${statusType} 상태인 예약이 존재하지 않습니다.</td>
										</tr>
									</c:if>
									
								    <c:forEach var="dto" items="${list}" >
										<tr align="center">
											<th scope="row">${dto.revConsultNo}</th>
									        <td>${dto.userId}</td>
									        <td>${dto.userName}</td>
									        <td>${dto.userHp}</td>
									        <td>${fn:substring(dto.revConsultDate, 0, 10)}</td>
									        <td>${fn:substring(dto.revConsultDate, 10, 16)}</td>
									        <td>
									        	<c:if test="${dto.trainerId == null}">
									        		<p <c:if test="${dto.revConsultStatus == '대기'}"> style="color:red" </c:if>>미지정</p>
									        	</c:if>
									        	<c:if test="${dto.trainerId != null}">
									      			${dto.trainerId}
									      		</c:if>
									        </td>
									        <td <c:if test="${dto.revConsultStatus == '대기'}"> style="color:red" </c:if>>
									        	${dto.revConsultStatus}
									        </td>
									        <td>
									        	<c:if test="${dto.revConsultStatus == '대기' || dto.revConsultStatus == '승인'}">
									        		<input type="button" value="수정" class="btn active" onclick="window.location='${path}/adRevConsultDetail.ad?revConsultNo=${dto.revConsultNo}'">
									        		<input type="button" value="취소" class="btn active" onclick="window.location='${path}/adRevConsultDelete.ad?revConsultNo=${dto.revConsultNo}'">
									        	</c:if>
									        </td>
									    </tr>
									</c:forEach>
								</tbody>
							</table>
							
							<c:if test="${paging.count != 0}">	
								<!-- 페이지컨트롤 시작 -->
								<br>
								<div style="width:1050px; margin:auto" >
									<nav aria-label="Page navigation example">
										<ul class="pagination justify-content-center">
											<li class="page-item">
												<c:if test="${paging.startPage > 10}">
												    <a class="page-link" href="${path}/adRevConsultList.ad?pageNum=${paging.prev}&statusType=${statusType}" aria-label="Previous">
												      <span aria-hidden="true">&laquo;</span>
												    </a>
											    </c:if>
											</li>
											
											<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
												<li class="page-item"><a class="page-link" href="${path}/adRevConsultList.ad?pageNum=${num}&statusType=${statusType}">${num}</a></li>
											</c:forEach>
											
											<li class="page-item">
												<c:if test="${paging.endPage < paging.pageCount}">
												    <a class="page-link" href="${path}/adRevConsultList.ad?pageNum=${paging.next}&statusType=${statusType}" aria-label="Next">
												      <span aria-hidden="true">&raquo;</span>
												    </a>
											    </c:if>
										    </li>
										</ul>
									</nav>
								</div>
								<!-- 페이지컨트롤 끝 -->
							</c:if>
						</form>
						<!-- 상담 예약 목록 끝 -->
						
					</div>
			<!-- 컨텐츠 끝 -->
			<hr>
		</div>
	</div>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>