<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 작성</title>
<link rel="stylesheet" href="${path}/resources/css/common/leftbar.css">
<script>
	$(function() {
		$("#noticeList").click(function() {
			location.href = "${path}/adNoticeList.ad"
		});
		
		// [게시글 작성] 버튼 클릭 시 [게시글 작성 처리]로 이동
		$("#noticeSave").click(function(){
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
			document.noticeInsertForm.action = "${path}/adNoticeInsertAction.ad";
			document.noticeInsertForm.submit();
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
               <h1 align="center">공지 사항 작성</h1>
               <hr>
            </div>
            <!-- 상단 중앙1 종료 -->
            
            <!-- 상단 중앙2 시작 -->
            <div id="section2">
               
				<!-- 좌측 메뉴 시작 -->                              
				<%@ include file= "/WEB-INF/views/admin/common/adMainLeft.jsp" %>
				<!-- 좌측메뉴 종료 -->
				<!-- 우측매뉴 시작 -->
				<form name ="noticeInsertForm" method="post" style="width:5400px;">
					<div class="row g-3 align-items-center">
						<div class="col-md-1" style="text-vertical:center">
							<h5>제목</h5>
						</div>
						<div class="col-md-11">
							<input type="text" name="noticeTitle" id="noticeTitle" class="form-control form-control-lg" placeholder="제목을 입력하세요" required autofocus>
						</div>
					</div>
					<br>
		
					<div class="row form-group">
						<textarea name="noticeContent" id="noticeContent" cols="30" rows="10" class="form-control form-control-lg" placeholder="내용을 입력해주세요"></textarea>
					</div>
					
				 	<!-- 버튼 -->
					<div class="form-group" align="right">
						<button type="reset" class="btn active">초기화</button>
						<button type="button" class="btn active" id="noticeList" name="noticeList">목록</button>
						<button type="button" class="btn active" id="noticeSave" name="noticeSave">작성</button>
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