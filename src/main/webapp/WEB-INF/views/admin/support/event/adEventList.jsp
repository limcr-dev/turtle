<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
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
	               <h1 align="center">EVENT</h1>
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
								<th scope="col">제목</th>
								<th scope="col">등록일자</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<tr>
								<th scope="row">1</th>
								<td>헬스 1주년 행사</td>
								<td>2025-02-04</td>
								<td>285</td>
							</tr>
							
							<tr>
								<th scope="row">1</th>
								<td>헬스 지인소개 행사</td>
								<td>2025-02-04</td>
								<td>120</td>
							</tr>
							
							<tr>
								<th scope="row">3</th>
								<td>헬스 등록시 커피 2잔무료</td>
								<td>2023.04.24</td>
								<td>54</td>
							</tr>
						</tbody>
					</table>
					<br>
					<!-- 우측메뉴 종료 -->
		            <!-- 상단 중앙2 종료 -->
				</div>
				<p align="center">
				SQL(이벤트 목록)<br>
				SELECT *<br>
				FROM event_tb<br>
				WHERE eventNo = eventNo<br>
				AND eventShow =Y<br>
				AND eventNo >= start<br>
				AND eventNo <= end
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