/**
 * join.js
 */
 
// adHealthInsert.jsp - P.T 횟수 체크

// 회원 조회
function searchId(){
	
	if(!document.inputform.userId.value){
		alert("아이디를 입력하세요!!");
		document.inputform.userId.focus();
		return false;
	}
	
	// 중복확인 버튼 클릭시 컨트롤러로 url을 전달, 컨트롤러에 추가
	let url = "/turtle/adIdConfirmAction.ad?userId=" + document.inputform.userId.value;
	window.open(url, "confirm", "menubar=no, width=500, height=400");
}

function signInCheck() {
	// 상태(헬스 또는 P.T) 선택 여부 확인
	const healthStatusChecked = document.querySelector('input[name="healthStatus"]:checked');
  
	if(document.inputform.hiddenSearchId.value == 0){
		alert("아이디를 조회해주세요");
		return false;
	}
	
	if (!healthStatusChecked) {
		alert("등록을 선택해주세요. (헬스 또는 P.T)");
		return false; // 제출 방지
	}
  
	if (!document.inputform.healthStartDate.value) {
		alert("시작일을 지정해주세요");
		return false; // 제출 방지
	}
  
	if (!document.inputform.healthEndDate.value) {
		alert("종료일을 지정해주세요");
		return false; // 제출 방지
	}
  
	if (document.inputform.trainerId.value == 0 && document.inputform.healthStatus.value == 'PT') {
		alert("담당 트레이너를 지정해주세요");
		return false; // 제출 방지
	}
  
	if (document.inputform.ptCnt.value == 0 && document.inputform.healthStatus.value == 'PT') {
		alert("PT횟수를 지정해주세요");
		return false; // 제출 방지
	}
	// 다른 검증 로직이 있으면 여기에 추가
	return true; // 검증 통과 시 제출 진행
}


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
  
  
  // "헬스" 선택 시 등록 기간 표시
  if (healthStatus == "헬스") {
    dateInputRow.style.display = "block";
  
    trainerRow.style.display = "none";
    ptCountRow.style.display = "none";
  } 
  // "P.T" 선택 시 선생님과 등록 횟수 표시
  else if (healthStatus == "PT") {
    trainerRow.style.display = "block";
    ptCountRow.style.display = "block";
    dateInputRow.style.display = "block";
 
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
