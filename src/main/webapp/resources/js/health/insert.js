/**
 * join.js
 */
 
// adHealthInsert.jsp - P.T 횟수 체크
function selectPtCntChk(){
	// 이메일 주소를 select박스로 선택하면 그 값이 userEmail2로 들어가도록 한다.
	if(document.inputform.ptCnt2.value == "0"){ // 직접입력
		document.inputform.ptCnt1.value == ""; 
		document.inputform.ptCnt1.focus();
		return false;
	}
	else{
		document.inputform.ptCnt1.value = document.inputform.ptCnt2.value;
		return false;
	}
	
}

// 회원 조회
function searchId(){
	
	if(!document.inputform.userId.value){
		alret("아이디를 입력하세요!!");
		document.inputform.userId.focus();
		return false;
	}
	
	// 중복확인 버튼 클릭시 컨트롤러로 url을 전달, 컨트롤러에 추가
	let url = "/turtle/adIdConfirmAction.ad?userId=" + document.inputform.userId.value;
	window.open(url, "confirm", "menubar=no, width=500, height=400");
}
 

// 3. 자식창에서 부모창으로 userid값을 전달 => 사용가능한 id를 찾은 경우
/*
	opener : window 객체의 open() 메서드로 열린 자식창(=중복확인창)에서 부모창(=회원가입창)에 접근할 때 사용
	hiddenUserid : 중복확인 버튼 클릭여부 체크(0:클릭안함, 1:클릭함)
	self.close(); // 자식창 닫기
*/

function setUserid(userId, userName, userHp){
	// alert(userid);
	
	
	
	opener.document.inputform.hiddenSearchId.value= "1";
	
	opener.document.inputform.userId.value= userId;
	opener.document.inputform.hiddenUserid.value= userId;
	
	opener.document.inputform.userName.value= userName;
	opener.document.inputform.hiddenuserName.value= userName;
	
	opener.document.inputform.userHp.value= userHp;
	opener.document.inputform.hiddenuserHp.value= userHp;
	self.close();
}


