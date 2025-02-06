<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adHealthList</title>
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
					<h1 align="center">헬스 회원 목록</h1>
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
								<th scope="col">담당트레이너</th>
								<th scope="col">P.T현황</th>
								<th scope="col">생일</th>
								<th scope="col">기간</th>
								<th scope="col">등록상태</th>
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<tr>
								<th scope="row">1</th>
								<td>강아지</td>
								<td>12</td>
								<td>1995.02.25</td>
								<td>24.12.02 ~ 25.07.12</td>
								<td>P.T</td>
							</tr>
						    
							<tr>
								<th scope="row">2</th>
								<td>고양이</td>
								<td></td>
								<td>1985.11.01</td>
								<td>24.01.02 ~ 25.12.12</td>
								<td>헬스</td>
							</tr>
						 
							<tr>
								<th scope="row">3</th>
								<td>강아지</td>
								<td>50</td>
								<td>1994.03.15</td>
								<td>24.04.08 ~ 25.01.14</td>
								<td>P.T</td>
							</tr>
						</tbody>
					</table>
					<!-- 우측메뉴 종료 -->
				<!-- 상단 중앙2 종료 -->
			</div>
			<p align="center">
			SQL(헬스 목록)<br>
			SELECT * <br>
			FROM health_tb<br>
			WHERE healthNo >= start<br>
			AND healthNo <= end<br>
			ORDER BY healthNo
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