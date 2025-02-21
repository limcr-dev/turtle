<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PT 예약</title>
<!-- revConsult.js -->
<script src="${path}/resources/js/reservation/revConsult.js" defer></script>

<!-- calendar.js, calender.css -->
<script src="${path}/resources/js/reservation/calendar.js" defer></script>
<link href='${path}/resources/css/common/calendar.css' rel='stylesheet' />

<!-- FullCalendar 불러오기 -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js"></script>

<!-- FullCalendar 언어 CDN --> 
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/locales-all.min.js'></script>

<script>

</script>
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		<c:if test="${insertCnt == 1}">
			<script type="text/javascript">
			alert("예약 완료되었습니다.");
			window.location="${path}/revPTList.do?userId=${sessionID}";
		</script>
		</c:if>
		
		<c:if test="${insertCnt != 1}">
			<script type="text/javascript">
			alert("다시 예약해주세요.");
			window.location="${path}/reservation.do";
		</script>
		</c:if>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>