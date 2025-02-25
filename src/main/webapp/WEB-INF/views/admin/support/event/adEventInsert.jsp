<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 이벤트 작성</title>
<link rel="stylesheet" href="${path}/resources/css/common/leftbar.css">
<script>
	$(function() {
		// 작성
		$("#eventSave").click(function(){
			const title = $("#eventTitle").val();
			const image = $("#eventImg").val();
			
			if(title == "") {
				alert("제목 입력!!");
				$("#eventTitle").focus();
				return false;
			} else if(image == "") {
				alert("이미지 첨부하세오");
				$("#eventImg").focus();
				return false;
			}
			document.eventInsertForm.action = "${path}/adEventInsertAction.ad";
			document.eventInsertForm.submit();
		});
		
		// 목록
		$("#eventList").click(function() {
			location.href = "${path}/adEventList.ad"
		});
		
		// 날짜 지정(시작날짜 이전은 지정x)
		$("#eventStartDate").change(function() {
	        const startDate = $(this).val();
	        $("#eventEndDate").attr("min", startDate);
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
					<form name ="eventInsertForm" method="post" style="width:5400px;" enctype="multipart/form-data">
					<div class="row g-3 align-items-center">
						<div class="col-md-1" style="text-vertical:center">
							<h5>제목</h5> 
						</div>
						<div class="col-md-11">
							<input type="text" name="eventTitle" id="eventTitle" class="form-control form-control-lg" placeholder="제목을 입력하세요" required autofocus>
						</div>
					</div>
					<br>
					
					<div class="row g-3 align-items-center">
						<div class="col-md-1"><h5>기간</h5></div>
						<div class="col-md-11 d-flex align-items-center gap-2">
							<input type="date" id="eventStartDate" name="eventStartDate" class="form-control form-control-lg" required>
							<input type="date" id="eventEndDate" name="eventEndDate" class="form-control form-control-lg" min={availableDay} required>
							
						</div>
					</div>
					<br>
					<div class="row form-group">
						<hr>
						<div class="addImage" id="addImage">
						</div>
						<input type="file" name="eventImg" id="eventImg" accept="image/*">
					</div>
					<div class="form-group" align="right">
						<input type="hidden" name="hidden_eventNo" value="${dto.evnetNo}">
						<button type="button" id="eventList" class="btn active" data-bs-toggle="button" aria-pressed="true">목록</button>
						<button type="reset" class="btn active">초기화</button>
						<button type="submit" id="eventSave" class="btn active" data-bs-toggle="button" aria-pressed="true">완료</button>
					</div>
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