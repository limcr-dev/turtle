<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복확인</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/customer/join.css">

<!-- join.js -->
<script src="${path}/resources/js/join/join.js" defer></script>

</head>
<body>
	<div class="wrap">
		<br>
		<div id="fh5co-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
					</div>
					<div class="col-md-6 animate-box">
						<p class="fs-1">아이디 중복확인</p>
						<br>		
						<form name="confirmform" action="idConfirmAction.do" method="post">
							
							<!-- id 중복일 때, id를 입력받아 다시 중복체크 -->
							<c:if test="${selectCnt == 1}">
							<div class="row g-3 align-items-center">
								<div class="col-md-12" align="center">
									<span style="color: #ff8000"><b>${userId}</b></span>는 사용할 수 없습니다. </span>
									<br><br><br>
								</div>
							</div>
							<div class="row g-3 align-items-center">
								<div class="col-md-3" >
									아이디
								</div>
								<div class="col-md-9">
									<input type="text" id="userId" name="userId" class="form-control form-control-lg" placeholder="아이디를 입력하세요" required autofocus>
								</div>
							</div>
							<br>
							<div class="form-group" align="right">
								<input type="submit" class="btn btn-dark" value="확인">
								<input type="reset" class="btn btn-dark" value="초기화">
							</div>
							</c:if>
							
							<!-- id 중복 아닐 때 -->
							<c:if test="${selectCnt == 0}">
							<div class="row g-3 align-items-center">
								<div class="col-md-12" align="center">
									<span style="color: #ff8000"><b>${userId}</b></span>는 사용할 수 있습니다.
									<br><br><br>
								</div>
							</div>
							<br>
							<div class="form-group" align="right">
								<input type="button" class="btn btn-dark" value="확인" onclick="setUserid('${userId}')">
							</div>
							</c:if>
							
						</form>
					</div>
				</div>
			</div>
		
		</div>
	</div>
	<!-- 컨텐츠 끝 -->

</body>
</html>