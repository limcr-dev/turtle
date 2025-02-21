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



// 선택된 라디오 버튼에 따라 표시할 필드를 결정하는 함수
function toggleInputs() {
  var healthStatus = document.querySelector('input[name="healthStatus"]:checked').value;
  
  // 각각의 입력 필드 선택
  var dateInputRow = document.getElementById('dateInputRow');
  var trainerRow = document.getElementById('trainerRow');
  var ptCountRow = document.getElementById('ptCountRow');
  var autoDateButtons = document.getElementById('autoDateButtons');
  
  // "헬스" 선택 시 등록 기간 표시
  if (healthStatus == "헬스") {
    dateInputRow.style.display = "block";
    autoDateButtons.style.display = "block";  // 자동 설정 버튼 보이기
    trainerRow.style.display = "none";
    ptCountRow.style.display = "none";
  } 
  // "P.T" 선택 시 선생님과 등록 횟수 표시
  else if (healthStatus == "PT") {
    trainerRow.style.display = "block";
    ptCountRow.style.display = "block";
    dateInputRow.style.display = "block";
    autoDateButtons.style.display = "none";  // P.T 상태일 때 자동 설정 버튼 숨기기
  }
}

// 등록 기간을 3개월, 6개월, 12개월 후로 자동 입력하는 함수
function setAutoDate(months) {
  var currentDate = new Date();
  var healthStartDate = document.getElementById('healthStartDate');
  var healthEndDate = document.getElementById('healthEndDate');
  
  // 시작 날짜는 현재 날짜로 설정
  healthStartDate.value = currentDate.toISOString().split('T')[0];
  
  // 종료 날짜는 시작 날짜에 months 만큼 더하기
  currentDate.setMonth(currentDate.getMonth() + months);
  healthEndDate.value = currentDate.toISOString().split('T')[0];
}

window.onload = function() {
  toggleInputs();
};


const healthEndDate = document.getElementById('healthEndDate').value;
  // 현재 날짜 구하기
  const currentDate = new Date();
  
  // healthEndDate를 Date 객체로 변환
  const endDate = new Date(healthEndDate);
  
  // 두 날짜의 차이 계산 (밀리초 단위)
  const timeDifference = endDate - currentDate;
  
  // 차이를 일수로 변환
  const daysRemaining = Math.ceil(timeDifference / (1000 * 60 * 60 * 24));
  
  // 남은 일수를 페이지에 출력
  document.getElementById('dateDifference').textContent = daysRemaining;
  
  

  
 