<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email 중복 확인</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/customer/join.css">

<!-- join.js -->
<script src="${path}/resources/js/join/join.js" defer></script>


<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js"></script>
   
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
						<p class="fs-1">이메일 중복확인</p>
						<br>		
						<form name="confirmform" action="idConfirmAction.do" method="post">
							
							<!-- email 중복일 때, email을 입력받아 다시 중복체크 -->
							<c:if test="${selectCnt == 1}">
							<div class="row g-3 align-items-center">
								<div class="col-md-12" align="center">
									<span style="color: #ff8000"><b>${userEmail}</b></span>는 이미 가입된 이메일 입니다. </span>
									<br><br>												
								</div>
							</div>
							<div class="row g-3 align-items-center">
								<div class="col-md-12" >
									다른 이메일 주소를 입력하여 주세요.
								</div>
							</div>
							<br>
							<div class="form-group" align="right">
								<input type="button" class="btn btn-dark" name="emailChk" value="확인" onclick="confirmEmail2()">
							</div>
							</c:if>
							
							<!-- email 중복 아닐 때 -->
							<c:if test="${selectCnt == 0}">
							<div class="row g-3 align-items-center">
								<div class="col-md-12" align="center">
									<span style="color: #ff8000"id="u_Email"><b>${userEmail}</b></span>는 사용할 수 있습니다.
									<br> 이메일 인증을 진행해 주세요.
									<br><br>
									
									<div class="col-md-12" align="center">
										<input type="button" class="btn btn-secondary" id="emailChk" name="emailChk" value="인증 메일 전송" onclick="sendEmail()">
									</div>
									<br><br>
								</div>
							</div>
							<br>
							<div class="col-md-12" align="center">
								<span class="code_msg">이메일 인증 코드를 입력해주세요.</span>
							</div>
							<br>
							<div class="input_container">
				                <!-- 이메일 인증 입력창 -->
				                <div class="col-md-12" align="center">
				                	<input type="text" id="auth_input" name="auth_input" align="center" class="input input_auth">
				                </div>
				            </div>
				            <br>
				            <div class="col-md-12" align="center">
								<input type="button" align="center" class="btn btn-dark" name="emailauth" value="인증 확인" onclick="confirmAuth()">
							</div>
							<br><br>
							<div class="ResendMail">
								<div class="col-md-12" align="center">
					            	<span>인증코드를 받지 못하셨나요?</span>
					            </div>	
					            <br>
					            <div class="col-md-12" align="center">					            
					            	<input type="button" class="btn btn-secondary" id="resend" name="resend" align="center" value="인증 메일 재전송" onclick="sendEmail2()">
					            </div>  
					        </div>
					        <br>
							<div class="form-group" align="right">
								<input type="button" class="btn btn-dark" value="확인" onclick="setUserEmail('${userEmail}')">
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