/**
 * join.js
 */
 
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
	// alert("중복확인");
	if(!document.inputform.userId.value){
		alret("아이디를 입력하세요!!");
		document.inputform.userId.focus();
		return false;
	}
	
	// 중복확인 버튼 클릭시 컨트롤러로 url을 전달, 컨트롤러에 추가
	let url = "/turtle/idConfirmAction.do?userId=" + document.inputform.userId.value;
	window.open(url, "confirm", "menubar=no, width=500, height=400");
}




// 2. join.jsp - onsubmit - 회원가입페이지 필수 체크
function signInCheck(){

	// <!-- 2-1. 중복확인 -->
	// <input type="hidden" name="hiddenUserid" value="0"> 
	// hiddenUserid : 중복확인 버튼 클릭여부 체크(0:클릭안함, 1:클릭함)
	
	// 2-2. 중복확인 버튼을 클릭하지 않는 경우 "중복확인 해주세요!" 메세지 띄운다.
	if(document.inputform.hiddenUserid.value == "0"){
		alert("중복확인 해주세요!");
		document.inputform.dubChk.focus();
		return false;
	}
	// 비밀번호 불일치
	if(document.inputform.userPw.value != document.inputform.r_userPw.value){
		alert("비밀번호 불일치, 재입력 하세요!!");
		document.inputform.userPw.value ="";
		document.inputform.r_userPw.value ="";
		document.inputform.userPw.focus();
		return false;
	}
}
	
function modifyCheck(){
	// 회원수정 - 비밀번호 불일치 
	if(document.modifyform.userPw.value != document.modifyform.r_userPw.value){
		alert("비밀번호 불일치, 재입력 하세요!!");
		document.modifyform.userPw.value ="";
		document.modifyform.r_userPw.value ="";
		document.modifyform.userPw.focus();
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
	// alert(userid);
	opener.document.inputform.userId.value= userId;
	opener.document.inputform.hiddenUserid.value= "1";
	self.close();
}


