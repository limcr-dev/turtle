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
		// 체크박스 클릭 시 회원 전체 선택
		$("#checkbox").change(function() {
			if(this.checked) {
				$(".selectCheck").prop("checked", true);
			} else {
				$(".selectCheck").prop("checked", false);
			}
		});
		
		// 조회
		$(".selectCustomer").click(function(){
			
			var userNo = $(this).closest("tr").find(".userNo").text().trim();
			
			document.customerListForm.action = "${path}/adCustomerDetail.ad?userNo=" + userNo;
			document.customerListForm.submit();
		});
		
		// 삭제
		$("#deleteCustomer").click(function(){
			document.customerListForm.action = "${path}/adNoticeDeleteAction.ad";
			document.customerListForm.submit();
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
				<%@ include file= "/WEB-INF/views/admin/common/adMainLeft.jsp" %>
				<!-- 좌측메뉴 종료 -->
				<!-- 우측매뉴 시작 -->
				<form name ="customerListForm" method="post" style="width:5000px">
					<table class="table">
						<thead>
							<tr>
								<th scope="col"><input type="checkbox" id="checkbox"></th>
								<th scope="col">No.</th>
								<th scope="col">ID</th>
								<th scope="col">이름</th>
								<!-- <th scope="col">주소</th>
								<th scope="col">생일</th>
								<th scope="col">전화번호</th>
								<th scope="col">이메일</th> -->
								<th scope="col">가입일</th>
								
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<c:forEach var="dto" items="${list}">
								<tr>
									<td><input type="checkbox" class="selectCheck"></td>
									<td class="userNo">${dto.userNo}</td>
									<td style="width:300px">${dto.userId}</td>
									<td style="width:300px">${dto.userName}</td>
									<%-- <td>${dto.userAddress}</td>
									<td>${dto.userBirthday}</td>
									<td>${dto.userHp}</td>
									<td>${dto.userEmail}</td> --%>
									<td style="width:500px">${dto.userRegDate}</td>
									<td  style="width:100px"><button type="button" class="selectCustomer btn active" class="btn active" data-bs-toggle="button" aria-pressed="true">조회</button></td>
								</tr>
							</c:forEach>
						</tbody>
						<tr>
					  		<td colspan="10" class="text-end">
					  			<input type="hidden" name="hidden_userNo" value="${dto.userNo}">
					  			 <button type="button" id="updateCustomer" class="btn active" data-bs-toggle="button" aria-pressed="true">관리자 지정</button>
					  			 <button type="button" id="deleteCustomer" class="btn active" data-bs-toggle="button" aria-pressed="true">삭제</button>
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