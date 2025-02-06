<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">

<!-- (3-3-2) 자바스크립트 소스 연결 -->
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
				
			<!-- 세션이 없는 경우 : 로그인 실패 -->
			<c:if test="${sessionScope.sessionID == null}">
				<div class="row">
					<div class="col-md-3">
					</div>
					<div class="col-md-6 animate-box">
						<p class="fs-1">로그인</p>
						<br>
						<form name="loginform" action="logInAction.do" method="post">
							<script type="text/javascript">
								alert("아이디와 비밀번호가 일치 하지 않습니다.");
							</script>
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
								<input type="button" value="회원가입" class="btn btn-dark">
							</div>
						</form>	
					</div>
					<div class="col-md-3">
					</div>
				</div>
			</c:if>
						
			<!-- 세션이 있는 경우 : 로그인 완료 -->
			<c:if test="${sessionScope.sessionID != null}">
				<div class="row">
					<div class="col-md-3">
					</div>
					<div class="col-md-6 animate-box" align="center">
						<p class="fs-1">마이페이지</p>
						<br>
				
						<div class="row g-3 align-items-center">
							<div class="col-md-12" align="center">
								<span style="color: #ff8000"><b>${sessionScope.sessionID}</b></span>님 환영합니다!
								<br><br><br>
							</div>
							
						</div>
						<div class="form-group" align="center">
							<input type="submit" value="회원수정" class="btn btn-dark" onclick="window.location='${path}/modifyUserDetail.do'">
							<input type="reset" value="회원탈퇴" class="btn btn-dark" onclick="window.location='${path}/deleteUser.do'">
							<input type="button" value="로그아웃" class="btn btn-dark" onclick="window.location='logout.do'">
				
							<!-- admin 관리자인 경우 : 상품등록 -->
							<c:if test="${sessionScope.sessionID =='admin'}">
								<input class="btn btn-secondary" type="button" value="관리자" onclick="window.location='adCustomerList.ad'">
							</c:if>
						</div>
					</div>
				</div>	
			</c:if>
			</div>
		</div>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>