<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<script>
	$(function() {
		// 목록
		$("#eventList").click(function() {
			location.href = "${path}/eventList.bo"
		});
	});
</script>
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
<title>Notice Detail</title>
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
		<h3 align="center">이벤트 상세</h3>
		<br>
		<br>
		
		<!-- 글목록 시작 -->
		<hr style="border:3px solid orange; width:1000px; margin:auto;">
		  			
		<table class="table" style="width:1000px; margin:auto;">
			
			<thead>
			    <tr>
					<th colspan="5" style="width:5%"><h4>${dto.eventTitle}</h4></th>
					<td align="right" colspan="5" style="width:5%"> 조회수 ${dto.eventViews}</td>
					
					<!-- <td align="right" colspan="5" style="width:5%">조회수 5</td> -->
			    </tr>
		    </thead>
		    <tbody>
			    <tr>
			        <td colspan="7">
			      		<img src="${dto.eventImage}" width=800px> 
			        </td>
			    </tr>
		    </tbody>
		    <tr>
		   		<td colspan="7" class="text-end">
					<button type="button" id="eventList" class="btn active" data-bs-toggle="button" aria-pressed="true">목록</button>	
		  		</td>
		    </tr>
		</table>
		<!-- 공지글목록 시작 -->
		<!-- 컨텐츠 끝 -->
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>
