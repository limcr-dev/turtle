<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adCustomerList</title>
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
				<h1 align="center">회원 목록</h1>
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
							<th scope="col">아이디</th>
							<th scope="col">이름</th>
							<th scope="col">주소</th>
							<th scope="col">생일</th>
							<th scope="col">전화번호</th>
							<th scope="col">이메일</th>
							<th scope="col">가입일</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>마크</td>
							<td>서울</td>
							<td>1995.02.25</td>
							<td>010-1234-5678</td>
							<td>mark@naver.com</td>
							<td>2025-01-15</td>
						</tr>
						    
						<tr>
							<th scope="row">2</th>
							<td>David</td>
							<td>데이비드</td>
							<td>남양주</td>
							<td>1985.08.17</td>
							<td>010-1234-5678</td>
							<td>david@naver.com</td>
							<td>2025-01-14</td>
						</tr>
						    
						<tr>
							<th scope="row">3</th>
							<td>Ann</td>
							<td>앤</td>
							<td>부산</td>
							<td>1999.07.08</td>
							<td>010-1234-5678</td>
							<td>Ann@naver.com</td>
							<td>2024-01-14</td>
						</tr>
					</tbody>
				</table>
											
				<!-- 우측메뉴 종료 -->
				<!-- 상단 중앙2 종료 -->
			</div>
			<p align="center">
			SQL(회원 목록)<br>
			SELECT * <br>
			FROM user_tb<br>
			WHERE userShow = Y<br>
			AND userNo >= start<br>
			AND userNo <= end<br>
			ORDER BY userNo
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