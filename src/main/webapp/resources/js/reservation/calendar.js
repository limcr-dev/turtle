/* 화면이 로딩되면 FullCalendar에서 가져온 달력 띄우기 */

// 현재 날짜 불러오기
var today = new Date();

// calendar 객체 지정
var calendarElement = document.getElementById('calendar');

document.addEventListener('DOMContentLoaded', function(){
	
	// FullCalendar 생성
	var calendar = new FullCalendar.Calendar(calendarElement, {
		themeSystem: 'bootstrap5',
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
		events: [],
		dateClick: function(info){	// 날짜 선택 시, 실행되는 함수
			console.log("clicked event occurs date : " + info.dateStr);
			addEventToCalendar(info.dateStr)
		}
		
		});
	calendar.render();
});

function addEventToCalendar(date){
	let url = "/turtle/revConsult.do?revDate=" + date;
	location.href = url;
}