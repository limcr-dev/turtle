<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 이벤트 상세페이지</title>
<link rel="stylesheet" href="${path}/resources/css/common/leftbar.css">
<script>
	$(function() {
		// 목록
		$("#eventList").click(function() {
			location.href = "${path}/adEventList.ad"
		});
		
		// 수정
		$("#eventUpdate").click(function(){
			document.eventDetailForm.action = "${path}/adEventUpdate.ad";
			document.eventDetailForm.submit();
		});
		
		// 삭제
		$("#eventDelete").click(function(){
			document.eventDetailForm.action = "${path}/adEventDelete.ad";
			document.eventDetailForm.submit();
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
               <h1 align="center">공지 사항 상세페이지</h1>
               <hr>
            </div>
            <!-- 상단 중앙1 종료 -->
            
            <!-- 상단 중앙2 시작 -->
            <div id="section2">
               
				<!-- 좌측 메뉴 시작 -->                              
				<%@ include file= "/WEB-INF/views/admin/common/adMainLeft.jsp" %>
				<!-- 좌측메뉴 종료 -->
				<!-- 우측매뉴 시작 -->
				<form name ="eventDetailForm" method="post" style="width:4300px; font-size:10pt;">
					<table class="table" style="width: 920px"><!-- class="table table-bordered"  -->
						<thead>
							<div class="form-group" align="right">
								<input type="hidden" name="hidden_eventNo" value="${dto.eventNo}">
								<button type="button" id="eventDelete" class="btn active" data-bs-toggle="button" aria-pressed="true">삭제</button>
					  			<button type="button" id="eventUpdate" class="btn active" data-bs-toggle="button" aria-pressed="true">수정</button>
					  			<button type="button" id="eventList" class="btn active" data-bs-toggle="button" aria-pressed="true">목록</button>
			  				</div>
		  				</thead>
		  				<br>
						<tbody>
								<tr>
									<th scope="col"> 작성자 </th>
									<td style="text-align:left">${dto.eventWriter}</td>
									
									<th scope="col"> 제목 </th>
									<td style="text-align:left">${dto.eventTitle}</td>
									
									<th scope="col"> 이벤트기간 </th>
									<td style="text-align:left">${dto.eventStartDate} ~ ${dto.eventEndDate}</td>
									
									<th scope="col"> 등록일자 </th>
									<td style="text-align:left">${fn:substring(dto.eventRegdate, 0, 10)}</td>
									
									<th scope="col"> 조회수 </th>
									<td style="text-align:left">${dto.eventViews}</td>
								</tr>
								<tr>
									<th scope="col"> 내용 </th>
									<td colspan="8" style="text-align:center"> 
										<img src="${dto.eventImage}" width=800px> 
									</td>
								</tr>
						</tbody>
					</table>
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