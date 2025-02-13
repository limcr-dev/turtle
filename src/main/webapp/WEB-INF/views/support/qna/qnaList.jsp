<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A Page</title>
<script type="text/javascript">
$(function(){
	$("#qnaInsert").click(function(){
		if(${sessionScope.sessionID == null}){
			alert("로그인 후 이용해주세요");
		}
		else{
			location.href="${path}/qnaInsert.bo";
		}
	});
});
</script>
<style>
td a {
   color: black;
   text-decoration: none;
}
</style>

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
		<br><br>
			
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
			    <c:forEach var="dto" items="${list}" >
				<tr>
					<th scope="row" style="text-align:center;">${dto.qnaNo}</th>
			        <td><a href="${path}/qnaDetailAction.bo?qnaNo=${dto.qnaNo}">${dto.qnaTitle}</a></td>
			        <td>${dto.qnaWriter}</td>
			        <td>${dto.qnaRegdate}</td>
			        <td>${dto.qnaStatus}</td>
			    </tr>
			    </c:forEach>
			    <c:if test="${sessionScope.sessionType != 'admin' && sessionScope.sessionType != 'trainer'}">
				    <tr>
				  		<td colspan="5" class="text-end">
				  			 <button type="button" class="btn active" data-bs-toggle="button" aria-pressed="true" id="qnaInsert">문의하기</button>
				  		</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		
		<!-- 페이지컨트롤 시작 -->
		<div style="width:1000px; margin:auto" >
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item">
						<c:if test="${paging.startPage > 10}">
						    <a class="page-link" href="${path}/qnaList.bo?pageNum=${paging.prev}" aria-label="Previous">
						      <span aria-hidden="true">&laquo;</span>
						    </a>
					    </c:if>
					</li>
					
					<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
						<li class="page-item"><a class="page-link" href="${path}/qnaList.bo?pageNum=${num}">${num}</a></li>
					</c:forEach>
					
					<li class="page-item">
						<c:if test="${paging.endPage < paging.pageCount}">
						    <a class="page-link" href="${path}/qnaList.bo?pageNum=${paging.next}" aria-label="Next">
						      <span aria-hidden="true">&raquo;</span>
						    </a>
					    </c:if>
				    </li>
				</ul>
			</nav>
		</div>
		<!-- 페이지컨트롤 끝 -->
		<!-- 컨텐츠 끝 -->
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>