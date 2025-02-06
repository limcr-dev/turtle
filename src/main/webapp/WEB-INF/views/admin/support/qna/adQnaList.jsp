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
				<h1 align="center">1:1 문의사항</h1>
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
							<th scope="col">댓글수</th>
							<th scope="col">등록일자</th>
							<th scope="col">처리상태</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
					<tr>
						<th scope="row">1</th>
						<td>염소</td>
						<td>헬스 정지 문의</td>
						<td>2</td>
						<td>2024.12.05</td>
						<td>답변완료</td>
					</tr>
					  
						<tr>
							<th scope="row">2</th>
							<td>고릴라</td>
							<td>헬스 환불 문의</td>
							<td>4</td>
							<td>2024.12.05</td>
							<td>미답변</td>
						</tr>
					  
						<tr>
							<th scope="row">3</th>
							<td>타조</td>
							<td>O.T 문의</td>
							<td>2</td>
							<td>2023.04.24</td>
							<td>답변완료</td>
						</tr>
					</tbody>
				</table>
				<br>
				<!-- 우측메뉴 종료 -->
	            <!-- 상단 중앙2 종료 -->
			</div>
			<p align="center">
				SQL(1:1 문의사항 목록)<br>
				SELECT *<br>
				FROM qna_tb<br>
				WHERE qnaNo = qnaNo<br>
				AND qnaWriter = qnaWriter<br>
				AND qnaTitle = qnaTitle<br>
				AND qnaCommentCnt = qnaCommentCnt<br>
				AND qnaRegdate = qnaRegdate<br>
				AND qnaStatus = qnaStatus
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