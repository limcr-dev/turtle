/**
 * join.js
 */
 
// adHealthInsert.jsp - P.T 횟수 체크

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
 

// 자식창에서 부모창으로 userid값을 전달

function setUserid(userId, userName, userHp){
	
	opener.document.inputform.hiddenSearchId.value= "1";
	
	opener.document.inputform.userId.value= userId;
	opener.document.inputform.hiddenUserid.value= userId;
	
	opener.document.inputform.userName.value= userName;
	opener.document.inputform.hiddenuserName.value= userName;
	
	opener.document.inputform.userHp.value= userHp;
	opener.document.inputform.hiddenuserHp.value= userHp;
	self.close();
}

// 오늘 날짜를 YYYY-MM-DD 형식으로 반환하는 함수
function getTodayDate() {
	const today = new Date();
    return today.toISOString().split('T')[0];
}

// 등록 기간 자동 설정 함수
function setAutoDate(months) {
    const healthStartDateInput = document.getElementById('healthStartDate');
    const healthEndDateInput = document.getElementById('healthEndDate');

    const startDateValue = healthStartDateInput.value;

    if (!startDateValue) {
      alert('먼저 시작일을 선택해주세요.');
      return;
    }

    const startDate = new Date(startDateValue);
    startDate.setMonth(startDate.getMonth() + months); // 종료일 계산
    healthEndDateInput.value = startDate.toISOString().split('T')[0]; // 종료일 입력

  }

// 시작일 변경 시 종료일 및 남은 일수 초기화
document.getElementById('healthStartDate').addEventListener('change', function () {
	document.getElementById('healthEndDate').value = '';
    document.getElementById('dateDifference').textContent = '';
});

// 페이지 로드 시 초기 설정
window.onload = function () {
	const healthStartDateInput = document.getElementById('healthStartDate');
	const today = getTodayDate();

    healthStartDateInput.setAttribute('min', today); // 오늘 이전 날짜 선택 방지
    calculateDateDifference(); // 종료일 있을 시 남은 일수 계산
};

// healthStatus에 따라 입력 항목 보이기/숨기기
function toggleInputs() {

    var healthStatus = document.querySelector('input[name="healthStatus"]:checked').value;

    var dateInputRow = document.getElementById('dateInputRow');
    var trainerRow = document.getElementById('trainerRow');
    var ptCountRow = document.getElementById('ptCountRow');
    var autoDateButtons = document.getElementById('autoDateButtons');

    // "헬스" 선택 시
    if (healthStatus === "헬스") {
		dateInputRow.style.display = "block";
		autoDateButtons.style.display = "block";  // 자동 설정 버튼 표시
		trainerRow.style.display = "none";
		ptCountRow.style.display = "none";
    } 
    // "P.T" 선택 시
    else if (healthStatus === "PT") {
		dateInputRow.style.display = "block";
		autoDateButtons.style.display = "block";  // 자동 설정 버튼 표시
		trainerRow.style.display = "block";
		ptCountRow.style.display = "block";
	}
}
