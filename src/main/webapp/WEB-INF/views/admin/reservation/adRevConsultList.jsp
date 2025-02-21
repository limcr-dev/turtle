<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adReservationList</title>
<link rel="stylesheet" href="${path}/resources/css/common/leftbar.css">
</head>
<body>
	<div class="wrap"> <!-- 스타일을 해주려고 class명을 지정함  -->
		<!-- header 시작 -->
		<%@include file= "/WEB-INF/views/common/header.jsp"%>
		
		<!-- header 끝 -->
		
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
				<!-- 상단 중앙1 시작 -->
				<div>
					<hr>
					<h1 align="center">예약 현황</h1>
					<hr>
				</div>
				<!-- 상단 중앙1 종료 -->
				
				<!-- 상단 중앙2 시작 -->
				<div id="section2">
						
				<!-- 좌측 메뉴 시작 -->               					
				<%@ include file= "/WEB-INF/views/common/leftmenu.jsp" %>
				<!-- 좌측메뉴 종료 -->
				
				<!-- 우측매뉴 시작 -->
				<table class="table">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">이름</th>
							<th scope="col">날짜</th>
							<th scope="col">예약상태</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<tr>
							<th scope="row">1</th>
							<td>유재석</td>
							<td>2025-02-24 11:30</td>
							<td>대기</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>아이유</td>
							<td>2025-02-20 10:30</td>
							<td>완료</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>박명수</td>
							<td>2025-02-15 17:30</td>
							<td>완료</td>
						</tr>
					</tbody>
				</table>
				<!-- 우측메뉴 종료 -->
				<!-- 상단 중앙2 종료 -->
			</div>
			<p align="center">
			SQL(예약 목록)<br>		
			SELECT * <br>
			FROM reservation_tb<br>
			WHERE reNo >= start<br>
			AND reNo <= end<br>
			ORDER BY reNo
			</p>
		</div>
		<!-- 컨텐츠 끝 -->
		<hr>
		</div>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>