<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservation Page</title>
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
			<br><br>
			<h3 align="center">예약</h3>
			<br>
			<br>
			
			<center>
				<img src="${path}/resources/images/temporary/reservation.png" width="1000px" alt="...">
				<br>
				<div>
					-- 예약등록<br>
					INSERT INTO reservation_tb<br>
					(reNo, reUserId, reDate, reStatus)<br>
					VALUES ((SELECT NVL(MAX(noticeNo) + 1, 1)FROM reservation_tb),<br>
					reUserId, sysdate, reStatus)<br>
				</div>
			</center>
		<!-- 컨텐츠 끝 -->
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>