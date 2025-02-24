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
<script type="text/javascript">
$(function(){
	$("#boardInsert").click(function(){
		if(${sessionScope.sessionID == null}){
			alert("로그인 후 이용해주세요");
		}
		else{
			location.href="${path}/boardInsert.bo";
		}
	});
});
</script>
<head>
<meta charset="UTF-8">
<title>Board Page</title>
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
						<button type="button" class="btn btn-warning">
							<a href="${path}/boardList.bo" style="text-decoration: none; color: inherit;">자유게시판</a>
						</button>
					    <button type="button" class="btn btn-light" >
							<a href="${path}/faqList.bo" style="text-decoration: none; color: inherit;"> FAQ</a>
					    </button>
					    <button type="button" class="btn btn-light" >
							<a href="${path}/qnaList.bo" style="text-decoration: none; color: inherit;">1:1문의</a>
						</button>
					</div>
				</div>
			<!-- 상단 메뉴바 끝 -->
		
			<hr>
			<h3 align="center">자유게시판</h3>
			<br>
			<br>
			
			<!-- 공지글목록 시작 -->
				<table class="table" style="width:1000px; margin:auto;">
					<thead>
					    <tr>
							<th scope="col" style="text-align:center; width:10%">번호</th>
					        <th scope="col" style="text-align:center; width:40%">제목</th>
					        <th scope="col" style="text-align:center; width:15%">작성자</th>
					        <th scope="col" style="text-align:center; width:15%">날짜</th>
					        <th scope="col" style="text-align:center; width:10%">조회수</th>
					    </tr>
				    </thead>
				    <tbody>
						<c:forEach var="dto" items="${list}">
						    <tr>
						        <th scope="row" style="text-align:center;">${dto.boardNo}</th>
						        <td><a href="${path}/boardDetail.bo?boardNo=${dto.boardNo}" style="color: inherit;"> ${dto.boardTitle} <span style="color: red;">[${dto.boardCommentCnt}]</span></a></td>
						        <td style="text-align:center">${dto.boardWriter}</td>
						        <td style="text-align:center">${fn: substring(dto.boardRegdate,0,16)} </td>
						        <td style="text-align:center">${dto.boardViews}</td>
						    </tr>
					    </c:forEach>
					    <tr>
				  		<td colspan="5" class="text-end">
				  			 <button type="button" class="btn active" data-bs-toggle="button" aria-pressed="true" id="boardInsert">작성하기</button>
				  		</td>
					</tr>
				    </tbody>
				</table>
			<!-- 공지글목록 시작 -->
			
			<!-- 페이지컨트롤 시작 -->
			<c:if test="${paging.count != 0}">
				<div style="width:1000px; margin:auto" >
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item">
								<c:if test="${paging.startPage > 10}">
								    <a class="page-link" href="${path}/boardList.bo?pageNum=${paging.prev}" aria-label="Previous">
								      <span aria-hidden="true">&laquo;</span>
								    </a>
							    </c:if>
							</li>
							
							<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
								<li class="page-item"><a class="page-link" href="${path}/boardList.bo?pageNum=${num}">${num}</a></li>
							</c:forEach>
							
							<li class="page-item">
								<c:if test="${paging.endPage < paging.pageCount}">
								    <a class="page-link" href="${path}/boardList.bo?pageNum=${paging.next}" aria-label="Next">
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
