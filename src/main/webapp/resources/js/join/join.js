/**
 * join.js
 */
// 전역 변수 선언
let ResponseCode = 'global';
let email_auth_result = 0;
var send_time;
var resend_time;
 
// join.jsp - 이메일 체크
function selectEmailChk(){
	// 이메일 주소를 select박스로 선택하면 그 값이 userEmail2로 들어가도록 한다.
	if(document.inputform.userEmail3.value == "0"){ // 직접입력
		document.inputform.userEmail2.value == ""; 
		document.inputform.userEmail2.focus();
		return false;
	}
	else{
		document.inputform.userEmail2.value = document.inputform.userEmail3.value;
		return false;
	}
}

// modifyDetailAction.jsp - 이메일 체크 
function u_selectEmailChk(){
	if(document.modifyform.userEmail3.value == "0"){ // 직접입력
		document.modifyform.userEmail2.value == ""; 
		document.modifyform.userEmail2.focus();
		return false;
	}
	else{
		document.modifyform.userEmail2.value = document.modifyform.userEmail3.value;
		return false;
	}
}

// 아이디 중복확인 버튼 클릭시
// 1. 중복확인 페이지 open
function confirmId(){
	// 아이디 정규식 지정 영문자로 시작하는 영문자 또는 숫자 6~20자 
	let reg_id = /^[a-z][a-z0-9]{5,19}$/;
	 
	
	// 정규식에 맞지않을 시에 alert창 
	if(!reg_id.test(document.inputform.userId.value)){
		alert("아이디 입력(영문자로 시작, 영문자 또는 숫자 조합 6~20글자)")
		document.inputform.userId.value = "";
		document.inputform.userId.focus();
		return false;
	}
	// 중복확인 버튼 클릭시 컨트롤러로 url을 전달, 컨트롤러에 추가
	let url = "/turtle/idConfirmAction.do?userId=" + document.inputform.userId.value;
	window.open(url, "confirm", "menubar=no, width=500, height=400");
}


// 이메일 중복확인 버튼 클릭시
function confirmEmail(){
	// 이메일 정규식 설정 
	let reg_email = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	
	// 이메일 정규식이랑 다를경우 alert창
	if(!reg_email.test(document.inputform.userEmail1.value + "@" + document.inputform.userEmail2.value)){
		 alert("잘못된 이메일입니다!!(id@xxx.xxx)");
		 document.inputform.userEmail1.value="";
		 document.inputform.userEmail2.value="";
		 document.inputform.userEmail1.focus();
		 return false;
	}
	
	// 중복확인 버튼 클릭시 컨트롤러로 url을 전달, 컨트롤러에 추가
<<<<<<< HEAD
	if(!document.inputform.userEmail1.value || !document.inputform.userEmail2.value){
		alert("이메일을 정확하게 입력하세요!");
		document.inputform.userEmail1.focus();
		return false;
	}
	else {
		userEmail = document.inputform.userEmail1.value + "@" + document.inputform.userEmail2.value
		let url = "/turtle/emailConfirmAction.do?userEmail=" + userEmail;
		window.open(url, "confirm", "menubar=no, width=600, height=500");
	}
=======
	userEmail = document.inputform.userEmail1.value + "@" + document.inputform.userEmail2.value;
	let url = "/turtle/emailConfirmAction.do?userEmail=" + userEmail;
	window.open(url, "confirm", "menubar=no, width=600, height=500");
>>>>>>> ac244e107c47ea1680f5e8a4005629b08af334c5
}

// 창에서 한번더 체크--id
function dublechk(){
	// 아이디 정규식 지정 영문자로 시작하는 영문자 또는 숫자 6~20자 
	let re_id = /^[a-z][a-z0-9]{5,19}$/;
	
	// id 정규식이랑 다를경우 alert창
	if(!re_id.test(document.confirmform.userId.value)){
		 alert("영문자로 시작, 영문자 또는 숫자 조합 6~20글자");
		 document.confirmform.userId.value="";
		 document.confirmform.userId.focus();
		 return false;
	}
}

// 이메일 중복확인창에서 중복 확인 버튼 클릭시
function confirmEmail2(){
<<<<<<< HEAD
	self.close();
}
	

function confirmEmail3(){
	if(!document.inputform.userEmail1.value || !document.inputform.userEmail2.value){
		alert("이메일을 정확하게 입력하세요!!");
		document.inputform.userEmail1.focus();
		return false;
	}
	else {
		// 중복확인 버튼 클릭시 컨트롤러로 url을 전달, 컨트롤러에 추가
		userEmail = document.confirmform.userEmail1.value + "@" + document.confirmform.userEmail2.value
		let url = "/turtle/emailConfirmAction.do?userEmail=" + userEmail;
		window.open(url, "confirm", "menubar=no, width=600, height=500");
	}
=======
	// 중복확인 버튼 클릭시 컨트롤러로 url을 전달, 컨트롤러에 추가
	userEmail = document.confirmform.userEmail1.value + "@" + document.confirmform.userEmail2.value;
	let url = "/turtle/emailConfirmAction.do?userEmail=" + userEmail;
	window.open(url, "confirm", "menubar=no, width=600, height=500");
>>>>>>> ac244e107c47ea1680f5e8a4005629b08af334c5
}

// 인증코드 발송 버튼 클릭시
function sendEmail(){
	
	const disableBtn = document.getElementById('emailChk');
  	disableBtn.disabled = true;
	
	// 이메일 주소를 url에서 가져오기
	const urlParams = new URL(window.location.href).searchParams; // 전체 url 가져오기
	const Emailaddr = urlParams.get('userEmail'); // url에서 필요한 파라미터 찾아 반환하기
	
	 // 메일 발송 후 지난 시간
    send_time = new Date();
      		
    // 랜덤 인증 코드(6자리) 생성 
    ResponseCode = Math.floor(Math.random() * 900000 + 100000);

	(function() {
        // EmailJS 계정 경로 : https://dashboard.emailjs.com/admin/account
        emailjs.init({
          // EMailJS API 연결을 위한 공유 Key
          publicKey: "BmjcXuKqOZnx3hUmY",
        });
		// 연결된 GMail 계정메일로 입력 받은 이메일 주소(user_email)로 메일 전송
        emailjs.send("service_or095gz","template_1j62m25", {to_name:Emailaddr, from_name: "seb.dev.it@gmail.com", message:ResponseCode});
    })();
	alert("인증 메일을 전송하였습니다. \n입력한 메일 수신함에서 인증메일을 확인하여 10분 내 인증을 완료해 주세요.\n(인증 메일은 60초 뒤에 재발송이 가능합니다.)");
}
    

// 인증코드 확인 버튼 클릭할 때
function confirmAuth(){

	auth_time = new Date();
	
	const diffMin = (auth_time.getTime() - send_time.getTime()) / (60*1000);
	
	if(diffMin < 10){
	    let code = auth_input.value;
	    // alert(code);
	    // 인증코드 검사 
	    if(ResponseCode == code){
	    	alert("이메일 인증에 성공하였습니다.");
	    	email_auth_result = 1;
	    }
	    else{
	    // 검증 실패
	    alert("인증코드가 일치하지 않습니다. 다시 확인하여 주십시오.");
	    }
	}
	else {
		// 인증 시간 초과
		alert("인증 시간(10분)이 초과 되었습니다. 다시 인증하여 주십시오."); 
	}	
		    
}

// 인증코드 재발송 버튼 클릭시
function sendEmail2(){
	
	resend_time = new Date();
	
	const diffSec = (resend_time.getTime() - send_time.getTime())/1000;
	const diffTime = Math.floor(diffSec);
	
	if(diffSec > 60){
	
		// 이메일 주소를 url에서 가져오기
		const urlParams = new URL(window.location.href).searchParams; // 전체 url 가져오기
		const Emailaddr = urlParams.get('userEmail'); // url에서 필요한 파라미터 찾아 반환하기
		
		 // 메일 발송 후 지난 시간
	    let resend_time = 0;
	   
	    after_send = setInterval(function () {
	            resend_time++
	        }, 1000);
			
	    // 랜덤 인증 코드(6자리) 생성 
	    ResponseCode = Math.floor(Math.random() * 900000 + 100000);
	
		(function() {
	        // EmailJS 계정 경로 : https://dashboard.emailjs.com/admin/account
	        emailjs.init({
	          // EMailJS API 연결을 위한 공유 Key
	          publicKey: "BmjcXuKqOZnx3hUmY",
	        });
			// 연결된 GMail 계정메일로 입력 받은 이메일 주소(user_email)로 메일 전송
	        emailjs.send("service_or095gz","template_1j62m25", {to_name:Emailaddr, from_name: "seb.dev.it@gmail.com", message:ResponseCode});
	    })();
		alert("인증 메일을 전송하였습니다. \n 입력한 메일 수신함에서 인증메일을 확인해 주세요.\n(60초 뒤에 재발송이 가능합니다.)");
	}
	else {
	   alert("인증 메일을 발송한 지 " + diffTime + " 초 되었습니다. \n인증 메일 발송 후 60초 뒤에 재발송이 가능합니다.")
	}             
}




// 2. join.jsp - onsubmit - 회원가입페이지 필수 체크
function signInCheck(){
	
	// <!-- 2-1. 중복확인 -->
	// <input type="hidden" name="hiddenUserid" value="0"> 
	// hiddenUserid : 중복확인 버튼 클릭여부 체크(0:클릭안함, 1:클릭함)
	
	// 2-2. ID 중복 확인 버튼을 클릭하지 않는 경우 "중복확인 해주세요!" 메세지 띄운다.
	if(document.inputform.hiddenUserid.value == "0"){
		alert("ID 중복확인 해주세요!");
		document.inputform.dubChk.focus();
		return false;
	}
	
	// 2-3. Email 중복 확인 버튼을 클릭하지 않는 경우 "중복확인 해주세요!" 메세지 띄운다.
	if(document.inputform.hiddenUserEmail.value == "0"){
		alert("이메일 인증 해주세요!");
		document.inputform.emailChk.focus();
		return false;
	}
	
	// 비밀번호 정규식 지정 숫자와 문자,특수문자 포함 형태의 8~15자리
	let reg_password = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
	
	// 비밀번호 정규식과 불일치시
	if(!reg_password.test(document.inputform.userPw.value)){
		alert("비밀번호 입력(숫자와 문자,특수문자 포함 형태의 8~15자리)");
		document.inputform.userPw.value = "";
		document.inputform.userPw.focus();
		return false;
	}
	
	// 비밀번호와 비밀번호 확인 불일치 
	if(document.inputform.userPw.value != document.inputform.r_userPw.value){
		alert("비밀번호 불일치, 재입력 하세요!!");
		document.inputform.userPw.value ="";
		document.inputform.r_userPw.value ="";
		document.inputform.userPw.focus();
		return false;
	}
	
	// 이름 정규식 설정
	let reg_name = /^[가-힣]{2,5}$/;
	// 이름 입력
	if(!reg_name.test(document.inputform.userName.value)){
		alert("이름 입력(한글 2~5글자)!!");
		document.inputform.userName.value = "";
		document.inputform.userName.focus();
		return false;
	}
	
	// 휴대폰 정규식 설정 - 02,010,070,080으로만 시작하고 숫자만 들어가면서 자릿수 길이 지정
	let reg_mobile = /^(02|010|070|080)-\d{3,4}-\d{4}$/;
	// 휴대폰번호 입력
	if(!reg_mobile.test(document.modifyform.userHp1.value + "-" + document.modifyform.userHp2.value + "-" + document.modifyform.userHp3.value)){
		alert("올바른 전화번호 형식이 아닙니다.(숫자만,(02,010,070,080중에서)-3~4자리-4자리)");
		document.modifyform.userHp1.value="";
		document.modifyform.userHp2.value="";
		document.modifyform.userHp3.value="";
		document.modifyform.userHp1.focus();
		return false;
	}
	document.inputform.submit();   // Enter로 이동은 못하나 탭키로 이동가능
}
	
function modifyCheck(){
	
	// 비밀번호 정규식 지정 숫자와 문자,특수문자 포함 형태의 8~15자리
	let reg_password = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
	
	// 비밀번호 입력
	if(!document.modifyform.userPw.value){
		alert("비밀번호 입력!!");
		document.modifyform.userPw.focus();
		return false;
	}
	
	// 비밀번호 정규식과 불일치시
	else if(!reg_password.test(document.modifyform.userPw.value)){
		alert("비밀번호 입력(숫자와 문자,특수문자 포함 형태의 8~15자리)");
		document.modifyform.userPw.value = "";
		document.modifyform.userPw.focus();
		return false;
	}
	
	// 비밀번호와 비밀번호 확인 불일치 
	if(document.modifyform.userPw.value != document.modifyform.r_userPw.value){
		alert("비밀번호 불일치, 재입력 하세요!!");
		document.modifyform.userPw.value ="";
		document.modifyform.r_userPw.value ="";
		document.modifyform.userPw.focus();
		return false;
	}
	
	// 이름 정규식 설정
	let reg_name = /^[가-힣]{2,5}$/;
	// 이름 입력
	if(!reg_name.test(document.modifyform.userName.value)){
		alert("이름 입력(한글 2~5글자)!!");
		document.modifyform.userName.value = "";
		document.modifyform.userName.focus();
		return false;
	}
	
	// 회원수정 - 비밀번호와 비밀번호 확인 불일치 
	else if(document.modifyform.userPw.value != document.modifyform.r_userPw.value){
		alert("비밀번호 불일치, 재입력 하세요!!");
		document.modifyform.userPw.value ="";
		document.modifyform.r_userPw.value ="";
		document.modifyform.userPw.focus();
		return false;
	}
	
	// 휴대폰 정규식 설정 - 02,010,070,080으로만 시작하고 숫자만 들어가면서 자릿수 길이 지정
	let reg_mobile = /^(02|010|070|080)-\d{3,4}-\d{4}$/;
	// 휴대폰번호 입력
	if(!reg_mobile.test(document.modifyform.userHp1.value + "-" + document.modifyform.userHp2.value + "-" + document.modifyform.userHp3.value)){
		alert("올바른 전화번호 형식이 아닙니다.(숫자만,(02,010,070,080중에서)-3~4자리-4자리)");
		document.modifyform.userHp1.value="";
		document.modifyform.userHp2.value="";
		document.modifyform.userHp3.value="";
		document.modifyform.userHp1.focus();
		return false;
	}
}


// 3. 자식창에서 부모창으로 userid값을 전달 => 사용가능한 id를 찾은 경우
/*
	opener : window 객체의 open() 메서드로 열린 자식창(=중복확인창)에서 부모창(=회원가입창)에 접근할 때 사용
	hiddenUserid : 중복확인 버튼 클릭여부 체크(0:클릭안함, 1:클릭함)
	self.close(); // 자식창 닫기
*/

function setUserid(userId){
	opener.document.inputform.userId.value= userId;
	opener.document.inputform.hiddenUserid.value= "1";
	self.close();
}

function setUserEmail(userEmail){
	mail = userEmail;
	var user_email = mail.split('@')
	opener.document.inputform.userEmail1.value= user_email[0];
	opener.document.inputform.userEmail2.value= user_email[1];
	opener.document.inputform.hiddenUserEmail.value = "1";
	self.close();
}
