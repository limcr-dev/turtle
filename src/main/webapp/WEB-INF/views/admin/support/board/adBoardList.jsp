<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
function page() {
    document.getElementById("statusForm").submit();
}
</script>
<head>
<meta charset="UTF-8">
<title>board</title>
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
					<h1 align="center">자유게시판 관리</h1>
					<hr>
				</div>
	            <!-- 상단 중앙1 종료 -->
	            
				<div id="section2">
					<div style="width:300px">
						<!-- 좌측 메뉴 시작 -->
						<%@ include file= "/WEB-INF/views/admin/common/adMainLeft.jsp" %>
						<!-- 좌측메뉴 종료 -->
					</div>
					<!-- 게시글 목록 시작 -->
					<form name ="statusForm" id="statusForm" action="${path}/adBoardList.ad" method="post" style="width:1300px">
						<table class="table" style="width:1050px; margin:auto;">
							<thead>
							    <tr>
							      <th scope="col" style="width:8%; text-align:center; height:41.5px">번호</th>
							        <th scope="col" style="width:30%; text-align:center;">제목</th>
							        <th scope="col" style="width:15%; text-align:center;">작성자</th>
							        <th scope="col" style="width:15%; text-align:center;">날짜</th>
							        <th scope="col" style="width:13%; text-align:center;">삭제유무</th>
							        <th scope="col" style="width:10%; text-align:center;">조회수</th>
							        <th scope="col" style="width:10%; text-align:center;">복구</th>
							    </tr>
							</thead>
							<tbody>
							    <c:forEach var="dto" items="${list}" >
									<tr>
										<th scope="row" style="text-align:center;">${dto.boardNo}</th>
								        <td style="text-align:left"><a href="${path}/adBoardDetail.ad?boardNo=${dto.boardNo}">${dto.boardTitle}</a></td>
								        <td>${dto.boardWriter}</td>
								        <td>${fn: substring(dto.boardRegdate,0,19)}</td>
								        <td>${dto.boardShow}</td>
								        <td>${dto.boardViews}</td>
								        <td>
									        <c:if test="${dto.boardShow == 'N'}">
									        	<button type="button" class="btn active"onclick="window.location='${path}/adBoardRestore.ad?boardNo=${dto.boardNo}'">복구</button>
									        </c:if>
								        </td>
								    </tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- 페이지컨트롤 시작 -->
						<br>
						<div style="width:900px; margin:auto" >
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<li class="page-item">
										<c:if test="${paging.startPage > 10}">
										    <a class="page-link" href="${path}/adBoardList.ad?pageNum=${paging.prev}" aria-label="Previous">
										      <span aria-hidden="true">&laquo;</span>
										    </a>
									    </c:if>
									</li>
									
									<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
										<li class="page-item"><a class="page-link" href="${path}/adBoardList.ad?pageNum=${num}">${num}</a></li>
									</c:forEach>
									
									<li class="page-item">
										<c:if test="${paging.endPage < paging.pageCount}">
										    <a class="page-link" href="${path}/adBoardList.ad?pageNum=${paging.next}" aria-label="Next">
										      <span aria-hidden="true">&raquo;</span>
										    </a>
									    </c:if>
								    </li>
								</ul>
							</nav>
						</div>
						<!-- 페이지컨트롤 끝 -->
					</form>
					<!-- 게시글 목록 끝 -->
					
				</div>
			<!-- 컨텐츠 끝 -->
			<hr>
		</div>
	</div>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>