<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 이벤트목록</title>
<link rel="stylesheet" href="${path}/resources/css/common/leftbar.css">
<script>
	$(function() {
		// 작성
		$("#insertEvent").click(function() {
			location.href = "${path}/adEventInsert.ad"
		});
		
		// 셀렉트 박스 삭제 유무 조회
		$(document).ready(function() {
			$("#selectEventShow").change(function() {
				var eventShow = $(this).val();
				var url = "${path}/adEventList.ad";
				
				if(eventShow != "") {
					url += "?eventShow=" + eventShow;
				}
				location.href = url;
			});
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
	               <h1 align="center">EVENT</h1>
	               <hr>
	            </div>
	            <!-- 상단 중앙1 종료 -->
	            
	            <!-- 상단 중앙2 시작 -->
	            <div id="section2">
					<!-- 좌측 메뉴 시작 -->                              
					<%@ include file= "/WEB-INF/views/admin/common/adMainLeft.jsp" %>
					<!-- 좌측메뉴 종료 -->
					
					<!-- 우측매뉴 시작 -->
					<form name="eventListForm" method="post" style="width:7000px">
						<table class="table">
							<thead>
								<tr>
									<th scope="col" style="text-align:center; width: 10%;"> 썸네일 </th>
									<th scope="col" style="text-align:center; width: 30%;">제목</th>
									<th scope="col" style="text-align:center; width: 10%;">작성자</th>
									<th scope="col" style="text-align:center; width: 30%;">이벤트기간</th>
									<th scope="col" style="text-align:center; width: 10%;">등록일자</th>
									<th scope="col" style="text-align:center; width: 10%;">조회수</th>
									<td>
										<select name="eventShow" id="selectEventShow">
											<option value="" <c:if test="${eventShow == ''}">selected</c:if>>삭제여부</option>
											<option value="Y" <c:if test="${eventShow == 'Y'}">selected</c:if>>Y</option>
											<option value="N" <c:if test="${eventShow == 'N'}">selected</c:if>>N</option>
										</select>
									</td>
								</tr>
							</thead>
							<tbody class="table-group-divider">
								<c:forEach var="dto" items="${list}">
									<tr>
										<td>
											<img src="${dto.eventImage}" style="position:relative; width:100px; height:50px; overflow: hidden">
										</td> 
										<td style="text-align:left; width:500px; vertical-align:middle;">
											<a style="color:black;" href="${path}/adEventDetail.ad?eventNo=${dto.eventNo}">${dto.eventTitle}</a>
										</td>
										<td style="text-align:center; width:200px; vertical-align:middle;">${dto.eventWriter}</td>
										<td style="text-align:center; vertical-align:middle;">${dto.eventStartDate} ~ ${dto.eventEndDate}</td>
										<td style="text-align:center; width:300px; vertical-align:middle;">${fn:substring(dto.eventRegdate, 2, 10)}</td>
										<td style="text-align:center; width:150px; vertical-align:middle;">${dto.eventViews}</td>
										<td style="width:50px; text-align:center; vertical-align:middle;">${dto.eventShow}</td>
									</tr>
								</c:forEach>
							</tbody>
							<tr>
								<td colspan="8" class="text-end">
									<button type="button" id="insertEvent" class="btn active" data-bs-toggle="button" aria-pressed="true">작성</button>
								</td>
							</tr>
						</table>
						<!-- 페이지컨트롤 시작 -->
						<c:if test="${paging.count != 0}">
							<div style="width:920px; margin:auto" >
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
								    	<li class="page-item">
								        	<c:if test="${paging.startPage > 10}">
								    			<a class="page-link" href="${path}/adNoticeList.ad?pageNum=${paging.prev}" aria-label="Previous">
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
						</c:if>
						<!-- 페이지컨트롤 끝 -->
					</form>
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