// revPT.js - 상담 예약
 
// 회원조회 버튼 클릭 시, 회원조회 및 인증 페이지 open
function revPTCheckUser(){
	if(!document.revPTForm.userId.value){
		alret("아이디를 입력하세요.");
		document.revPTForm.userId.focus();
		return false;
	}
	
	// 회원조회 버튼 클릭 시, revController로 요청 전달
	let url = "/turtle/revPTCheckUser.do?userId=" + document.revPTForm.userId.value;
	window.open(url, "confirm", "menubar=no, width=500, height=300");
	
}


// 상담 예약 페이지 필수 체크
function revPTCheck(){

	// 회원 조회 및 비밀번호 인증
	// <input type="hidden" name="hiddenCheckPTUser" value="0"> 
	// hiddenCheckUser : 회원조회 버튼 클릭여부 체크(0:클릭안함, 1:클릭함)
	
	// 회원 조회 여부 확인
	if(document.revPTForm.hiddenCheckPTUser.value == "0"){
		alert("회원 인증 해주세요.");
		document.revPTForm.userChk.focus();
		return false;
	}
	
	// 날짜 체크 여부 확인
	if(document.revPTForm.hiddenRevDate.value == null || document.revPTForm.hiddenRevDate.value == ""){
		alert("날짜를 선택해주세요.");
		return false;
	}
	
	// 시간 체크 여부 확인
	if(document.revPTForm.revTime.value == null || document.revPTForm.revTime.value == ""){
		alert("시간을 선택해주세요.");
		return false;
	}
}

	
// 비밀번호 인증 성공 시, userId를 부모창으로 전달
function setUser(userId, userName, userHp, trainerId){
	opener.document.revPTForm.userId.value = userId;
	opener.document.revPTForm.hiddenUserId.value = userId;
	
	opener.document.revPTForm.userName.value = userName;
	opener.document.revPTForm.hiddenUserName.value = userName;
	
	opener.document.revPTForm.userHp.value = userHp;
	opener.document.revPTForm.hiddenUserHp.value = userHp;
	
	opener.document.revPTForm.trainerId.value = trainerId;
	opener.document.revPTForm.hiddenTrainerId.value = trainerId;
	
	opener.document.revPTForm.hiddenCheckPTUser.value = "1";
	self.close();
}

// 관리자 PT 예약 수정 필수 체크
function updateRevConsulCheck(){

	// 예약 상태 지정 여부 확인
	if(document.updateForm.statusType.value == '' || document.updateForm.statusType.value == null){
		alert("예약 상태를 지정해주세요.");
		document.updateForm.statusType.focus();
		return false;
	}
}

