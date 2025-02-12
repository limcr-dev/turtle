<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adCustomerList</title>
<link rel="stylesheet" href="${path}/resources/css/common/leftbar.css">
<script>
	$(function() {
		// 목록
		$("#customerList").click(function() {
			location.href = "${path}/adCustomerList.ad"
		});
		// 삭제
		$("#deleteCustomer").click(function(){
			document.noticeDetailForm.action = "${path}/adNoticeDeleteAction.ad";
			document.noticeDetailForm.submit();
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
				<h1 align="center">회원 목록</h1>
				<hr>
			</div>
			<!-- 상단 중앙1 종료 -->
			
			<!-- 상단 중앙2 시작 -->
			<div id="section2">
	
				<!-- 좌측 메뉴 시작 -->               					
				<%@ include file= "/WEB-INF/views/common/leftmenu.jsp" %>
				<!-- 좌측메뉴 종료 -->
				<!-- 우측매뉴 시작 -->
				<form name ="customerDetailForm" method="post">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">No.</th>
								<th scope="col">ID</th>
								<th scope="col">이름</th>
								<th scope="col">주소</th>
								<th scope="col">생일</th>
								<th scope="col">전화번호</th>
								<th scope="col">이메일</th>
								<th scope="col">일반 / 관리자</th>
								
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<tr>
								<td>${dto.userNo}</td>
								<td>${dto.userId}</td>
								<td>${dto.userName}</td>
								<td>${dto.userAddress}</td>
								<td>${dto.userBirthday}</td>
								<td>${dto.userHp}</td>
								<td>${dto.userEmail}</td>
								<c:if test="${dto.userType == 'admin'}">
									<td>관리자</td>
								</c:if>
								<c:if test="${dto.userType == 'user'}">
									<td>일반회원</td>
								</c:if>
							</tr>
						</tbody>
						<tr>
					  		<td colspan="10" class="text-end">
					  			 <button type="button" id="updateCustomer" class="btn active" data-bs-toggle="button" aria-pressed="true">관리자 지정</button>
					  			 <button type="button" id="deleteCustomer" class="btn active" data-bs-toggle="button" aria-pressed="true">삭제</button>
					  			 <button type="button" id="customerList" class="btn active" data-bs-toggle="button" aria-pressed="true">목록</button>
					  		</td>
						</tr>
					</table>
				</form>					
				<!-- 우측메뉴 종료 -->
				<!-- 상단 중앙2 종료 -->
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