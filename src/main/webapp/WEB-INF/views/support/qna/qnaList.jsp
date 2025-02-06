<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A Page</title>
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		
		<!-- 컨텐츠 시작 -->
		<!-- 상단 메뉴바 -->
		<br>
		<div  style="width:1000px; margin:auto" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
			<div class="btn-group me-2" role="group" aria-label="Second group">
				<button type="button" class="btn btn-light">
					<a href="${path}/noticeList.bo" style="text-decoration: none; color: inherit;">공지사항</a>
				</button>
				<button type="button" class="btn btn-light">
					<a href="${path}/eventList.bo" style="text-decoration: none; color: inherit;">이벤트</a>
				</button>
				<button type="button" class="btn btn-light">
					<a href="${path}/boardList.bo" style="text-decoration: none; color: inherit;">자유게시판</a>
				</button>
			    <button type="button" class="btn btn-light" >
					<a href="${path}/faqList.bo" style="text-decoration: none; color: inherit;"> FAQ</a>
			    </button>
			    <button type="button" class="btn btn-warning" >
					<a href="${path}/qnaList.bo" style="text-decoration: none; color: inherit;">1대1문의</a>
				</button>
			</div>
		</div>
		<!-- 상단 메뉴바 끝 -->
			
		<hr>
		<h3 align="center">1대1 문의</h3>
		<br>
		<br>
			
		<!-- 문의목록 시작 -->
		<table class="table" style="width:1000px; margin:auto;">
			<thead>
			    <tr>
			      <th scope="col" style="width:5%">번호</th>
			        <th scope="col" style="width:40%">제목</th>
			        <th scope="col" style="width:15%">작성자</th>
			        <th scope="col" style="width:15%">날짜</th>
			        <th scope="col" style="width:10%">처리</th>
			    </tr>
			</thead>
		    <tbody>
			    <tr>
					<th scope="row" style="text-align:center;">1</th>
			        <td>pt문의</td>
			        <td>김태희</td>
			        <td>2025-02-03</td>
			        <td>완료</td>
			    </tr>
			    <tr>
					<th scope="row" style="text-align:center;">2</th>
					<td>시설문의</td>
					<td>아이유</td>
					<td>2025-02-01</td>
					<td>미처리</td>
			    </tr>
			    <tr>
					<th scope="row" style="text-align:center;">3</th>
					<td>문의</td>
					<td>비</td>
					<td>2025-02-01</td>
					<td>완료</td>
			    </tr>
			    <tr>
			  		<td colspan="5" class="text-end">
			  			 <button type="button" class="btn active" data-bs-toggle="button" aria-pressed="true">문의하기</button>
			  		</td>
				</tr>
			</tbody>
		</table>
		<!-- 문의목록 끝 -->
			
		<!-- 페이지컨트롤 시작 -->
		<div style="width:1000px; margin:auto" >
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item">
					    <a class="page-link" href="#" aria-label="Previous">
					      <span aria-hidden="true">&laquo;</span>
					    </a>
					</li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item">
					    <a class="page-link" href="#" aria-label="Next">
					      <span aria-hidden="true">&raquo;</span>
					    </a>
				    </li>
				</ul>
			</nav>
		</div>
		<!-- 페이지컨트롤 끝 -->
		<!-- 컨텐츠 끝 -->
		<p align="center">
			SELECT *<br>
				FROM qna_tb<br>
				WHERE qnaShow = 'Y' <br>
				AND qnaNo >= start <br>
				AND qnaNo <= end <br>
				ORDER BY qnaNo <br>
		</p>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>