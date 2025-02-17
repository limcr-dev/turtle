<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 예약</title>
<!-- revConsult.js -->
<script src="${path}/resources/js/reservation/revConsult.js" defer></script>

<!-- calendar.js, calender.css -->
<script src="${path}/resources/js/reservation/calendar.js" defer></script>
<link href='${path}/resources/css/common/calendar.css' rel='stylesheet' />

<!-- FullCalendar 불러오기 -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js"></script>

<!-- FullCalendar 언어 CDN --> 
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/locales-all.min.js'></script>

</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		<br>
		
		<!-- 세션이 없는 경우 : 예약 불가로 alert창 띄운 후, 로그인 페이지로 이동 -->
		<c:if test="${sessionScope.sessionID == null}">
			<script type="text/javascript">
				alert("로그인 후 이용해주세요.");
				window.location="${path}/login.do"
			</script>
		</c:if>
		
		<!-- 세션이 있는 경우 : 예약 가능 -->
		<c:if test="${sessionScope.sessionID != null}">
			<div id="fh5co-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-2">
					</div>
					<div class="col-md-8 animate-box">
						<p class="fs-1">상담 예약</p>
						<br>
						<form name="revConsultForm" action="revConsultAction.do" method="post"
							onsubmit="return revConsultCheck()">
							
							<!-- 회원 조회 -->
							<input type="hidden" name="hiddenCheckUser" value="0">
							
							<!-- sessionID 값으로 회원 인증 -->
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									아이디
								</div>
								<div class="col-md-8">
									<input type="text" name="userId" id="userId" class="form-control form-control-lg" value="${sessionID}" disabled>
								</div>
								<div class="col-md-2">
									<input type="button" class="btn btn-secondary" name="userChk" value="회원인증" onclick="revCheckUser()">
								</div>
							</div>
							
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									이름
								</div>
								<div class="col-md-10">
									<input type="text" id="userName" name="userName" class="form-control  form-control-lg"  value="${dto.userHp}" disabled>
								</div>
							</div>
							<br>
							 
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									전화번호
								</div>
								<div class="col-md-10">
									<input type="text" id="userHp" name="userHp" class="form-control form-control-lg" value="${dto.userHp}" disabled>
								</div>
							</div>
							<br>
							<hr>
							<br>
							<div class="row g-3 align-items-center">
								<div class="col-md-12" align="center"><b>예약 날짜와 시간을 선택하세요</b></div>
								<br>
									<div class="col-md-12" id="calendar">
									
									</div>
								<!-- <div class="col-md-6">
									예약 시간 띄울 예정
									</div> 
								-->
							</div>
							<br>
							<div class="form-group" align="right">
								<input type="submit" value="예약하기" class="btn btn-dark">
							</div>
						</form>	
					</div>	
				</div>
			</div>
			<div class="col-md-2">
			</div>	
		</div>
		</c:if>
		
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>