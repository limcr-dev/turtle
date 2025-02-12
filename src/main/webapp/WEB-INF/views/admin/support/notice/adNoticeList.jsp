<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 목록</title>
<link rel="stylesheet" href="${path}/resources/css/common/leftbar.css">
<script>
	$(function() {
		$("#insertNotion").click(function() {
			location.href = "${path}/adNoticeInsert.ad"
		});
	});
</script>
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
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.noticeNo}</td>
								<td>
									<a style="color:black" href="${path}/adNoticeDetail.ad?noticeNo=${dto.noticeNo}">${dto.noticeTitle}</a>
								</td>
								<td>${dto.noticeWriter}</td>
								<td>${dto.noticeRegdate}</td>
								<td>${dto.noticeViews}</td>
							</tr>
						</c:forEach>
					</tbody>
					<tr>
				  		<td colspan="5" class="text-end">
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
										<li class="page-item"><a class="page-link" href="${path}/adNoticeList.ad?pageNum=${num}">${num}</a></li>
										</c:forEach>
								
										<li class="page-item">
								   			<c:if test="${paging.endPage < paging.pageCount}">
								    			<a class="page-link" href="${path}/adNoticeList.ad?pageNum=${paging.next}" aria-label="Next">
								      				<span aria-hidden="true">&raquo;</span>
								    			</a>
								 			</c:if>
										</li>
									</ul>
								</nav>
							</div>
							
							<button type="button" id="insertNotion" class="btn active" data-bs-toggle="button" aria-pressed="true">공지작성</button>
				  		</td>
					<!-- 페이지컨트롤 끝 -->
					</tr>
					
				</table>
			
				<br>
				<!-- 우측메뉴 종료 -->
				<!-- 상단 중앙2 종료 -->
			</div>
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