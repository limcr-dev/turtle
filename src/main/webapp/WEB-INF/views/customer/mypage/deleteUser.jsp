<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>

<!-- join.js -->
<script src="${path}/resources/js/join/join.js" defer></script>
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		<br>
		<div id="fh5co-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
					</div>
					
					<div class="col-md-6 animate-box">
						<p class="fs-1">회원 탈퇴 비밀번호 인증</p>
						<br>
						<form name="passwordform" action="deleteUserAction.do" method="post">
							<div class="row g-3 align-items-center">
								<div class="col-md-3" >
									아이디
								</div>
								<div class="col-md-9">
									<span style="color: #ff8000"><b>${sessionScope.sessionID}</b></span>님 비밀번호를 입력해주세요.
								</div>
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-3">
									비밀번호
								</div>
								<div class="col-md-9">
									<input type="password" id="userPw" name="userPw" class="form-control form-control-lg" placeholder="비밀번호를 입력하세요" required>
								</div>
							</div>
							<br>
							
							<div class="form-group" align="right">
								<input type="submit" value="회원탈퇴" class="btn btn-dark">
								<input type="reset" value="탈퇴취소" class="btn btn-dark" onclick="window.location='main.do'">
							</div>
						</form>	
					</div>
					<div class="col-md-3">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>