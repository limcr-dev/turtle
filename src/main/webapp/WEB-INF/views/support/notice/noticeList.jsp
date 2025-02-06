<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<style>
	#customAccordionButton:focus {
	    box-shadow: none !important; /* 기본 부트스트랩 효과 제거 */
	    border: 2px solid #000000 !important; /* 클릭 시 검은색 테두리 */
  	}
   	.btn btn-light{
  		background-color:orange-500;
  	} 
</style>
<head>
<meta charset="UTF-8">
<title>Notice Page</title>
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
			    <button type="button" class="btn btn-warning">
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
			    <button type="button" class="btn btn-light" >
					<a href="${path}/qnaList.bo" style="text-decoration: none; color: inherit;">1대1문의</a>
				</button>
			</div>
		</div>
		<!-- 상단 메뉴바 끝 -->
		
		<hr>
		<h3 align="center">공지사항</h3>
		<br>
		<br>
			
		<!-- 공지글목록 시작 -->
		<table class="table" style="width:1000px; margin:auto;">
			<thead>
			    <tr>
					<th scope="col" style="width:5%">번호</th>
			        <th scope="col" style="width:40%">제목</th>
			        <th scope="col" style="width:15%">작성자</th>
			        <th scope="col" style="width:15%">날짜</th>
			        <th scope="col" style="width:10%">조회수</th>
			    </tr>
		    </thead>
		    <tbody>
			    <tr>
			        <th scope="row" style="text-align:center;">1</th>
			        <td><a href="${path}/noticeDetail.bo" style="color: inherit;"> pt문의</a></td>
			        <td>김태희</td>
			        <td>2025-02-03</td>
			        <td>0</td>
			    </tr>
			    <tr>
			        <th scope="row" style="text-align:center;">2</th>
			        <td>시설문의</td>
			        <td>아이유</td>
			        <td>2025-02-01</td>
			        <td>4</td>
			    </tr>
			    <tr>
			        <th scope="row" style="text-align:center;">3</th>
			        <td>문의</td>
			        <td>비</td>
			        <td>2025-02-01</td>
			        <td>532</td>
			    </tr>
		    </tbody>
		</table>
		<!-- 공지글목록 시작 -->
		
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
				FROM notice_tb<br>
				WHERE noticeNo = noticeNo<br>
				AND noticeShow = 'Y'<br>
				AND noticeNo >= start<br>
				AND noticeNo <= end<br>
		</p>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>
