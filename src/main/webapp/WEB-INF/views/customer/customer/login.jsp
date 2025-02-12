<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

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
						<p class="fs-1">로그인</p>
						<br>
						<form name="loginform" action="loginAction.do" method="post">
							<div class="row g-3 align-items-center">
								<div class="col-md-3" >
									아이디
								</div>
								<div class="col-md-9">
									<input type="text" id="userId" name="userId" class="form-control form-control-lg" placeholder="아이디를 입력하세요" required autofocus>
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
								<input type="submit" value="로그인" class="btn btn-dark">
								<input type="reset" value="초기화" class="btn btn-dark">
								<input type="button" value="회원가입" class="btn btn-dark" onclick="window.location='join.do'">
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