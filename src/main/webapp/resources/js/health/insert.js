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
 
 


