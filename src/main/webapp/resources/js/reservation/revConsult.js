// revConsult.js - 상담 예약
 
// 회원조회 버튼 클릭 시, 회원조회 및 인증 페이지 open
function revConsultCheckUser(){
	if(!document.revConsultForm.userId.value){
		alret("아이디를 입력하세요.");
		document.revConsultForm.userId.focus();
		return false;
	}
	
	// 회원조회 버튼 클릭 시, revController로 요청 전달
	let url = "/turtle/revConsultCheckUser.do?userId=" + document.revConsultForm.userId.value;
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
	
	// 날짜 체크 여부 확인
	if(document.revConsultForm.hiddenRevDate.value == null || document.revConsultForm.hiddenRevDate.value == ""){
		alert("날짜를 선택해주세요.");
		return false;
	}
	
	// 시간 체크 여부 확인
	if(document.revConsultForm.revTime.value == null || document.revConsultForm.revTime.value == ""){
		alert("시간을 선택해주세요.");
		return false;
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

// 관리자 상담 예약 수정 필수 체크
function updateRevConsulCheck(){

	// 트레이너 지정
	// <input type="hidden" name="hiddenSelectTrainer" value="0"> 
	// hiddenSelectTrainer : 담당자 지정 여부 체크(0:지정안함, 1:지정함)
	
	// 예약 상태 여부 확인
	if(document.updateForm.statusType.value == '' || document.updateForm.statusType.value == null){
		alert("예약 상태를 지정해주세요.");
		document.updateForm.statusType.focus();
		return false;
	}else{
		// 승인 시 트레이너 지정 여부 확인
		if(document.updateForm.statusType.value == '승인'){
			if(document.updateForm.trainerSelect.value == '' || document.updateForm.trainerSelect.value == null){
				alert("예약을 승인하려면 담당자를 지정해주세요.");
				document.updateForm.trainerSelect.focus();
				return false;
			}
		}
	}
}

