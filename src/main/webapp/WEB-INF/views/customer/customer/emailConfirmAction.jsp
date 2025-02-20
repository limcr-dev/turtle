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

<script type="text/javascript">
   
    // 메일 발송 후 지난 시간
    let current_time = 0;
    // 인증 유효 시간 
    let minutes,seconds;
    let timer_thread;

    // 인증코드 유효시간 카운트다운 및 화면 출력
    function timer_start(){
        
        // 인증코드 유효성 true
        code_valid = true;
        // 현재 발송 시간 초기화
        current_time = 0
        // 300초(10분)
        let count = 600

        timer.innerHTML = "10:00"
        // 1초마다 실행
        timer_thread = setInterval(function () {
            
            minutes = parseInt(count / 60, 10);
            seconds = parseInt(count % 60, 10);
    
            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;
            timer.innerHTML  = minutes + ":" + seconds;

            // 타이머 끝
            if (--count < 0) {
                timer_stop();
                // code msg "인증코드가 만료되었습니다."
                code_msg.textContent = "인증코드가 만료되었습니다.";
            }
            current_time++
        }, 1000);
    } 

    // 타이머 종료
    function timer_stop(){
        // 타이머 종료
        clearInterval(timer_thread)
        // 유효시간 만료
		code_valid = false
    }

    // 인증코드가 유효하면 true, 만료되었다면 false 반환
    function iscodeValid(){
        return code_valid;
    }

    // 인증코드 발송 후 60초 확인 : 60초 이후 true, 60초 이전 false
    function isRerequest(){
        return  current_time>=60?true:false;
    } 
  
}

</script>

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
									<br>
									<input type="text" name="userEmail" id="userEmail" class="form-control form-control-lg" value=${userEmail} }>
									
									<br><br>
								</div>
							</div>
							<div class="row g-3 align-items-center">
								<div class="col-md-3" >
									다른 이메일로 가입하시려면 새로운 이메일 주소를 입력하여 주세요.
								<div class="row g-3 align-items-center">
								<div class="col-md-2">
									이메일
								</div>
								<div class="col-md-3">
								
								  <label class="visually-hidden" for="specificSizeInputName">Name</label>
								  <input type="text" class="form-control form-control-lg" id="userEmail1" name="userEmail1" placeholder="이메일" required>
								</div>
								<div class="col-md-4">
								  <label class="visually-hidden" for="specificSizeInputGroupUsername">Username</label>
								  <div class="input-group">
								    <div class="input-group-text">@</div>
								    <input type="text" class="form-control form-control-lg" id="userEmail2" name="userEmail2" placeholder="이메일 주소" required>
								  </div>
								</div>
								<div class="col-md-3">
								  <label class="visually-hidden" for="specificSizeSelect">Preference</label>
								  <select class="form-select  form-select-lg" id="userEmail3" name="userEmail3" onchange="selectEmailChk()">
								    <option selected>선택</option>
								    <option value="naver.com">네이버</option>
								    <option value="google.com">구글</option>
								    <option value="daum.net">다음</option>
								    <option value="nate.com">네이트</option>
								  </select>
								</div>
							</div>
							</div>
							<br>
							<div class="form-group" align="right">
								<input type="button" class="btn btn-dark" name="emailChk" value="확인" onclick="confirmEmail2()">
								<input type="reset" class="btn btn-dark" value="초기화">
							</div>
							</c:if>
							
							<!-- email 중복 아닐 때 -->
							<c:if test="${selectCnt == 0}">
							<div class="row g-3 align-items-center">
								<div class="col-md-12" align="center">
									<span style="color: #ff8000"id="u_Email"><b>${userEmail}</b></span>는 사용할 수 있습니다.
									<br> 이메일 인증을 진행해 주세요.
									<br><br>
									
									<div class="col-md-2" align="center">
										<input type="button" class="btn btn-secondary" name="emailChk" value="인증 메일 전송" onclick="sendEmail()">
									</div>
									<br><br>
								</div>
							</div>
							<br>
								<span class="code_msg">이메일 인증 코드를 입력해주세요.</span>
							<br>
							<div class="input_container">
				                <!-- 이메일 인증 입력창 -->
				                <input type="text" id="auth_input" name="auth_input" class="input input_auth">
				            </div>
				            <br>
							<input type="button" class="btn btn-dark" name="emailauth" value="인증 확인" onclick="confirmAuth()">
							<br><br>
							<div class="ResendMail">
					            <span>인증코드를 받지 못하셨나요?</span>
					            <br><br>					            
					            <input type="button" class="btn btn-secondary" name="resend" value="인증 메일 재전송" onclick="sendEmail()">  
					        </div>
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