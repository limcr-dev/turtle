<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 상세페이지</title>
<%-- <link rel="stylesheet" href="${path}/resources/css/common/leftbar.css"> --%>
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
				<%@ include file= "/WEB-INF/views/common/leftmenu.jsp" %>
				<!-- 좌측메뉴 종료 -->
				<!-- 우측매뉴 시작 -->
				<form name ="noticeDetailForm" method="post">
					<table class="table">
						<tbody class="table-group-divider">
								<tr>
									<th style="width: 80px"> 번호 </th>
									<td style="width: 80px; text-align:center">${dto.noticeNo}</td>
									
									<th> 작성자 </th>
									<td>${dto.noticeWriter}</td>
									
									<th> 제목 </th>
									<td>${dto.noticeTitle}</td>
									
									<th> 등록일자 </th>
									<td>${dto.noticeRegdate}</td>
									
									<th> 조회수 </th>
									<td>${dto.noticeViews}</td>
								</tr>
								<tr>
									<th> 내용 </th>
									<td colspan="10">${dto.noticeContent} </td>
								</tr>
						</tbody>
						<tr>
					  		<td colspan="10" class="text-end" align="center">
					  			<input type="hidden" name="hidden_noticeNo" value="${dto.noticeNo}">
								<button type="button" class="btn active" id="noticeUpdate">수정</button>
								<button type="button" class="btn active" id="noticeDelete">삭제</button>
								<button type="button" class="btn active" id="noticeList">목록</button>
							</td>
						</tr>
					
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