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
		
		// 복구
		$("#restoreCustomer").click(function(){
			var userId = $(".userId").text().trim(); // userId 가져오기

	        $("#hidden_UserId").val(userId);
			document.customerDetailForm.action = "${path}/adCustomerRestore.ad";
			document.customerDetailForm.submit();
		});
	});
</script>
<style>
	tr {
		vertical-align: middle
	}
	
	td {
		text-align : left
	}
</style>
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
				<h1 align="center">회원 상세 조회</h1>
				<hr>
			</div>
			<!-- 상단 중앙1 종료 -->
			
			<!-- 상단 중앙2 시작 -->
			<div id="section2">
				<!-- 좌측 메뉴 시작 -->               					
				<%@ include file= "/WEB-INF/views/admin/common/adMainLeft.jsp" %>
				<!-- 좌측메뉴 종료 -->
				<!-- 우측매뉴 시작 -->
				<div class="col-md-3">
				</div>
	  			<form name ="customerDetailForm" method="post" style="width:4500px; font-size:10pt;">
					<table class="table table-bordered" style="width: 600px">
						<thead>
							<div class="form-group" align="right">
					  			<input type="hidden" name="hidden_userId" value="${dto.userId}">
					  			<%-- <button type="button" id="updateTrainer" class="btn active" data-bs-toggle="button" aria-pressed="true">트레이너</button>
					  			<button type="button" id="updateAdmin" class="btn active" data-bs-toggle="button" aria-pressed="true">관리자</button>
					  			<button type="button" id="updateCustomer" class="btn active" data-bs-toggle="button" aria-pressed="true">일반회원</button> --%>
					  			<button type="button" id="restoreCustomer" class="btn active" data-bs-toggle="button" aria-pressed="true">복구</button>
					  			<button type="button" id="customerList" class="btn active" data-bs-toggle="button" aria-pressed="true">목록</button>
			  				</div>
						</thead>
						<br>
						<tbody>
							<tr>
								<th scope="col">ID</th>
								<td class="userId">${dto.userId}</td>
							</tr>
							<tr>
								<th scope="col">이름</th>
								<td>${dto.userName}</td>
							</tr>
							<tr>
								<th scope="col">성별</th>
								<c:if test="${dto.userGender == 'M'}">
									<td>남성</td>
								</c:if>
								<c:if test="${dto.userGender == 'F'}">
									<td>여성</td>
								</c:if>
							</tr>
							<tr>
								<th scope="col">주소</th>
								<td>${dto.userAddress}</td>
							</tr>
							<tr>
								<th scope="col">생일</th>
								<td>${dto.userBirthday}</td>
							</tr>
							<tr>
								<th scope="col">전화번호</th>
								<td>${dto.userHp}</td>
							</tr>
							<tr>
								<th scope="col">이메일</th>
								<td>${dto.userEmail}</td>
							</tr>
							<tr>
								<th scope="col">회원 구분</th>
								<c:if test="${dto.userType == 'admin'}">
									<td>관리자</td>
								</c:if>
								<c:if test="${dto.userType == 'user'}">
									<td>일반회원</td>
								</c:if>
								<c:if test="${dto.userType == 'trainer'}">
									<td>트레이너</td>
								</c:if>
							</tr>
							<tr>
								<th scope="col">삭제 여부</th>
								<c:if test="${dto.userShow == 'Y'}">
									<td>-</td>
								</c:if>
								
								<c:if test="${dto.userShow == 'N'}">
									<td>삭제 된 회원입니다.</td>
								</c:if>
							</tr>
						</tbody>
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