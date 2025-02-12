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
	               <h1 align="center">FAQ</h1>
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
							<th scope="col">작성자</th>
							<th scope="col">제목</th>
							<th scope="col">질문유형</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						
						<tr>
							<th scope="row">1</th>
							<td>관리자1</td>
							<td>헬스 이용 안내</td>
							<td>헬스</td>
						</tr>
						
						<tr>
							<th scope="row">2</th>
							<td>관리자1</td>
							<td>P.T 이용안내</td>
							<td>P.T</td>
						</tr>
						
						<tr>
							<th scope="row">2</th>
							<td>관리자2</td>
							<td>헬스장 운영시간</td>
							<td>헬스</td>
						</tr>
					  
					</tbody>
				</table>
				<br>
				<!-- 우측메뉴 종료 -->
	            <!-- 상단 중앙2 종료 -->
	         </div>
	         <p align="center">
		         SQL(FAQ 목록)<br>
		         SELECT *<br>
		         FROM faq_tb<br>
		         WHERE faqWriter = faqWriter<br>
		         AND faqTitle = faqTitle<br>
		         AND faqType = faqType<br>
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