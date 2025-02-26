<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- insert.js -->
<script src="${path}/resources/js/health/insert.js" defer></script>
<title>헬스 회원 목록</title>
<link rel="stylesheet" href="${path}/resources/css/common/leftbar.css">
<script type="text/javascript">
function page() {
	document.getElementById("healthForm").submit();
}

</script>
<script>
	$(function(){
		$("#btnInsert").click(function(){
			location.href="${path}/adHealthInsert.ad";
		});
	});
</script>

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
					<h1 align="center">헬스 회원 목록</h1>
					<hr>
				</div>
				<!-- 상단 중앙1 종료 -->
				
				<!-- 상단 중앙2 시작 -->
				<div id="section2">
					<!-- 좌측 메뉴 시작 -->               					
					<%@ include file= "/WEB-INF/views/admin/common/adMainLeft.jsp" %>
					<!-- 좌측메뉴 종료 -->
					
					<!-- 헬스회원 목록 -->	
					<form name="healthForm" id="healthForm" method="post" style="width:1300px">
						<table class="table" style="width:1050px; margin:auto;">
							<thead>
								<tr>
									<th scope="col" style="width:10%; text-align:center;">등록번호</th>
									<th scope="col" style="width:10%; text-align:center;">회원 이미지</th>
									<th scope="col" style="width:10%; text-align:center;">이름</th>
									<th scope="col" style="width:20%; text-align:center;">전화번호</th>
									<th scope="col" style="width:10%; text-align:center;">
									<select class="" name="statusType" id="listSize" onchange="page()">
										<option value=""
											<c:if test="${statusType == ''}">selected="selected"</c:if>>전체유형</option>
										<option value="헬스"
											<c:if test="${statusType == '헬스'}">selected="selected"</c:if>>헬스</option>
										<option value="PT"
											<c:if test="${statusType == 'PT'}">selected="selected"</c:if>>PT</option>
									</select>
									</th>
									<th scope="col" style="width:30%; text-align:center;">등록기간
									</th>
									<th scope="col" style="width:10%; text-align:center;">설정</th>
								</tr>
							</thead>
														
							<tbody>
								<c:if test = "${paging.count == 0 }">
									<tr>
										<td align="center" colspan="6"> 헬스 등록 회원이 존재하지 않습니다.</td>
									</tr>
								</c:if>
								<c:forEach var='dto' items="${list}">
									<tr>
										<td style="vertical-align: middle;">${dto.healthNo}</td>
										<td style="vertical-align: middle;">
											<c:if test="${dto.healthImg == null}">
												<p style="color:gray">미등록</p>
											</c:if>
											
											<c:if test="${dto.healthImg != null}">
												<img src = "${dto.healthImg}" width="100px">
											</c:if>
										</td>
										<td style="vertical-align: middle;">${dto.userName}</td>
										<td style="vertical-align: middle;">${dto.userHp}</td>
										<td style="vertical-align: middle;">${dto.healthStatus}</td>
										<td style="vertical-align: middle;">
										    ${dto.healthStartDate} ~ <span class="healthEndDate">${dto.healthEndDate}</span>
										</td>
										<td>
											<div>
												<input class="btn btn-light" type="button" value="상세"
												onclick="window.location = '${path}/adHealthDetailAction.ad?healthNo=${dto.healthNo}&pageNum=${paging.currentPage}'">
											</div>
											<br>
											<div>
												<input class="btn btn-light" type="button" value="삭제"
												onclick="window.location = '${path}/adHealthDeleteAction.ad?healthNo=${dto.healthNo}'">
											</div>											
										</td>
									</tr>
								</c:forEach>
							</tbody>
							
							<tr>
                               <td colspan="11" align="center" >
                                  <input type="button" class="btn btn-light" value="회원 등록" id="btnInsert">
                               </td>
                           	</tr>					
						</table>						
						<br>
						<c:if test = "${paging.count != 0 }">
							<div style="width:900px; margin:auto" >
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
										<li class="page-item">
											<c:if test="${paging.startPage > 10}">
											    <a class="page-link" href="${path}/adHealthList.ad?pageNum=${paging.prev}&statusType=${statusType}" aria-label="Previous">
											      <span aria-hidden="true">&laquo;</span>
											    </a>
										    </c:if>
										</li>
										
										<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
											<li class="page-item"><a class="page-link" href="${path}/adHealthList.ad?pageNum=${num}&statusType=${statusType}">${num}</a></li>
										</c:forEach>
										
										<li class="page-item">
											<c:if test="${paging.endPage < paging.pageCount}">
											    <a class="page-link" href="${path}/adHealthList.ad?pageNum=${paging.next}&statusType=${statusType}" aria-label="Next">
											      <span aria-hidden="true">&raquo;</span>
											    </a>
										    </c:if>
									    </li>
									</ul>
								</nav>
							</div>
						</c:if>
					</form>
				</div>
			</div>
		<!-- 컨텐츠 끝 -->
		<hr>
		</div>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>
