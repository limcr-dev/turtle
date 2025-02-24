<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event Page</title>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
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
						<button type="button" class="btn btn-warning">
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
			<h3 align="center">이벤트</h3>
			<br>
			<br>
			
			<!-- 이벤트카드 목록 시작 -->
			
				<div class="row" style="width:1000px; display : flex; margin:auto">
					<c:forEach var="dto" items="${list}">
						<div class="col-md-4 ">
							<div class="card" style="width: 18rem;"onclick="window.location='${path}/eventDetail.bo?eventNo=${dto.eventNo}'">
								<img src="${dto.eventImage}" height="180px" class="card-img-top" >
								<div class="card-body">
									<p class="card-text">${dto.eventTitle}</p>
									<p class="card-text"> 기간 : ${dto.eventStartDate} ~ ${dto.eventEndDate}</p>
							    </div>
							</div>
							<br><br>
						</div>
					</c:forEach>
				</div>
				
			<!-- 이벤트카드 목록 시작 -->
			
			<!-- 페이지컨트롤 시작 -->
			<c:if test="${paging.count != 0}">
				<div style="width:920px; margin:auto" >
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
					    	<li class="page-item">
					        	<c:if test="${paging.startPage > 10}">
					    			<a class="page-link" href="${path}/eventList.bo?pageNum=${paging.prev}" aria-label="Previous">
					      				<span aria-hidden="true">&laquo;</span>
					    			</a>
					 			</c:if>
							</li>
						
							<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
							<li class="page-item"><a class="page-link" href="${path}/eventList.bo?pageNum=${num}">${num}</a></li>
							</c:forEach>
					
							<li class="page-item">
					   			<c:if test="${paging.endPage < paging.pageCount}">
					    			<a class="page-link" href="${path}/eventList.bo?pageNum=${paging.next}" aria-label="Next">
					      				<span aria-hidden="true">&raquo;</span>
					    			</a>
					 			</c:if>
							</li>
						</ul>
					</nav>
				</div>
			</c:if>
			<!-- 페이지컨트롤 끝 -->
		<!-- 컨텐츠 끝 -->
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>