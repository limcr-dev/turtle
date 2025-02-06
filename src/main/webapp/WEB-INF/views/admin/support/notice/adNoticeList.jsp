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
               <h1 align="center">공지 사항</h1>
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
							<th scope="col">작성자</th>
							<th scope="col">등록일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<tr>
							<th scope="row">1</th>
							<td>설날 휴무 안내</td>
							<td>강아지</td>
							<td>2025-02-20</td>
							<td>151</td>
						</tr>
						
						<tr>
							<th scope="row">2</th>
							<td>헬스 정기 휴무 안내</td>
							<td>고양이</td>
							<td>2024.11.24</td>
							<td>145</td>
						</tr>
						
						<tr>
							<th scope="row">3</th>
							<td>헬스 시간 단축 안내</td>
							<td>원숭이</td>
							<td>2023.04.24</td>
							<td>178</td>
						</tr>
					</tbody>
				</table>
				<br>
				<!-- 우측메뉴 종료 -->
				<!-- 상단 중앙2 종료 -->
			</div>
			<p align="center">
				SQL(공지사항)<br>
				SELECT *<br>
				FROM notice_tb<br>
				WHERE noticeNo = noticeNo<br>
				AND noticeTitle = noticeTitle<br>
				AND noticeWriter = noticeWriter<br>
				AND noticeRegdate = noticeRegdate<br>
				AND noticeViews = noticeViews
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