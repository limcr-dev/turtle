/* 화면이 로딩되면 FullCalendar에서 가져온 달력 띄우기 */

// 현재 날짜 불러오기
var today = new Date();

// calendar 객체 지정
var calendarElement = document.getElementById('calendar');

// document가 load될 때 calendar 띄우기
document.addEventListener('DOMContentLoaded', function(){
	
	// FullCalendar 생성
	var calendar = new FullCalendar.Calendar(calendarElement, {
		locale: 'ko',
		timeZone: 'local',	// 현지 시간
		initialView: 'dayGridMonth',	// 뷰 지정
		headerToolbar: {	// 헤더 메뉴 지정
			left: 'prev',
			center: 'title',
			right: 'next'
			},
		validRange: function() {	// 예약 가능 날짜 지정(당일+1 ~ 당일+30)
			var startDate = new Date();
			var endDate = new Date();
			startDate.setDate(startDate.getDate() + 1);
			endDate.setDate(endDate.getDate() + 30);
		    return {
		      start: startDate,
		      end: endDate
		    };
		},
		weekends: true,		// 주말 활성화
		selectable: true,	// 날짜 선택 가능
		// 현재 예약 날짜에 시간을 title로 event 지정
		events: [{title: document.updateForm.hiddenRevTime.value,
					start: document.updateForm.hiddenRevDate.value,
					color: '#ee8432'
				}],
		dateClick: function(info){	// 날짜 선택 시, 실행되는 함수
			let trainerId = document.updateForm.hiddenTrainerId.value;
			addEventToCalendar(info.dateStr, trainerId);
		}
		
	});
	calendar.render();
});

// 날짜 선택 시, 예약가능한 시간 DB에서 조회
function addEventToCalendar(date, trainerId){
	let param = {"revDate" : date, "trainerId" : trainerId};
	
	// 선택된 날짜 hiddenRevDate값으로 지정
	document.updateForm.hiddenRevDate.value = date;
	
	// ajax로 화면에 시간 띄우기
	$.ajax({
		url: 'revPTDateCheck.do',
		type: 'GET',
		data: param,
		success: function(result){
			$('#revTimeShow').html(result);
		},
		error: function(){
			alert('날짜를 다시 선택해주세요.');
		}
	});
}
