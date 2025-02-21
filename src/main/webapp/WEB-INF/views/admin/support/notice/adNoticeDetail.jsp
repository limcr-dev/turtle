<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 상세페이지</title>
<link rel="stylesheet" href="${path}/resources/css/common/leftbar.css">
<script>
	$(function() {
		// 목록
		$("#noticeList").click(function() {
			location.href = "${path}/adNoticeList.ad"
		});
		
		// 수정
		$("#noticeUpdate").click(function(){
			const title = $("#noticeTitle").val();
			const content = $("#noticeContent").val();
			
			if(title == "") {
				alert("제목 입력!!");
				$("#noticeTitle").focus();
				return false;
			} else if(content == "") {
				alert("내용!! 입력!!");
				$("#noticeContent").focus();
				return false;
			}
			document.noticeDetailForm.action = "${path}/adNoticeUpdate.ad";
			document.noticeDetailForm.submit();
		});
		
		// 삭제
		$("#noticeDelete").click(function(){
			document.noticeDetailForm.action = "${path}/adNoticeDeleteAction.ad";
			document.noticeDetailForm.submit();
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
				<form name ="noticeDetailForm" method="post" style="width:4300px; font-size:10pt;">
					<table class="table" style="width: 920px"><!-- class="table table-bordered"  -->
						<thead>
							<div class="form-group" align="right">
								<input type="hidden" name="hidden_noticeNo" value="${dto.noticeNo}">
								<button type="button" id="noticeDelete" class="btn active" data-bs-toggle="button" aria-pressed="true">삭제</button>
					  			<button type="button" id="noticeUpdate" class="btn active" data-bs-toggle="button" aria-pressed="true">수정</button>
					  			<button type="button" id="noticeList" class="btn active" data-bs-toggle="button" aria-pressed="true">목록</button>
			  				</div>
		  				</thead>
		  				<br>
						<tbody>
								<tr>
								<th scope="col"> No. </th>
									<td style="text-align:left">${dto.noticeNo}</td>
									
									<th scope="col"> 작성자 </th>
									<td style="text-align:left">${dto.noticeWriter}</td>
									
									<th scope="col"> 제목 </th>
									<td style="text-align:left">${dto.noticeTitle}</td>
									
									<th scope="col"> 등록일자 </th>
									<td style="text-align:left">${dto.noticeRegdate}</td>
									
									<th scope="col"> 조회수 </th>
									<td style="text-align:left">${dto.noticeViews}</td>
								</tr>
								<tr>
									<th scope="col"> 내용 </th>
									<td colspan="8" style="text-align:center">${dto.noticeContent} </td>
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