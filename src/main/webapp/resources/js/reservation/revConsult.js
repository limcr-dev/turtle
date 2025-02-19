// revConsult.js - 상담 예약
 
// 회원조회 버튼 클릭 시, 회원조회 및 인증 페이지 open
function revCheckUser(){
	if(!document.revConsultForm.userId.value){
		alret("아이디를 입력하세요.");
		document.revConsultForm.userId.focus();
		return false;
	}
	
	// 회원조회 버튼 클릭 시, revController로 요청 전달
	let url = "/turtle/revCheckUser.do?userId=" + document.revConsultForm.userId.value;
	window.open(url, "confirm", "menubar=no, width=500, height=300");
	
}


// 상담 예약 페이지 필수 체크
function revConsultCheck(){

	// 회원 조회 및 비밀번호 인증
	// <input type="hidden" name="hiddenCheckUser" value="0"> 
	// hiddenCheckUser : 회원조회 버튼 클릭여부 체크(0:클릭안함, 1:클릭함)
	
	// 회원 조회 여부 확인
	if(document.revConsultForm.hiddenCheckUser.value == "0"){
		alert("회원 인증 해주세요.");
		document.revConsultForm.userChk.focus();
		return false;
	}
	
	// 날짜, 시간 체크 여부 확인
	if(document.revConsultForm.revTime.value == null || document.revConsultForm.revTime.value == ""){
		alert("날짜와 시간을 선택해주세요.");
		document.revConsultForm.revTime.focus();
		return false;
	} else {
		document.revConsultForm.hiddenRevTime.value = document.revConsultForm.revTime.value;
	}
	
}
	
// 비밀번호 인증 성공 시, userId를 부모창으로 전달
function setUser(userId, userName, userHp){
	opener.document.revConsultForm.userId.value = userId;
	opener.document.revConsultForm.hiddenUserId.value = userId;
	
	opener.document.revConsultForm.userName.value = userName;
	opener.document.revConsultForm.hiddenUserName.value = userName;
	
	opener.document.revConsultForm.userHp.value = userHp;
	opener.document.revConsultForm.hiddenUserHp.value = userHp;
	
	opener.document.revConsultForm.hiddenCheckUser.value = "1";
	self.close();
}

