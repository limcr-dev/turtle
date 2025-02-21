<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 수정</title>
</head>

<body>
	<div class="wrap">
		<!-- header 시작 -->
			<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		
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
				<button type="button" class="btn btn-light">
					<a href="${path}/boardList.bo" style="text-decoration: none; color: inherit;">자유게시판</a>
				</button>
			    <button type="button" class="btn btn-light" >
					<a href="${path}/faqList.bo" style="text-decoration: none; color: inherit;"> FAQ</a>
			    </button>
			    <button type="button" class="btn btn-warning" >
					<a href="${path}/qnaList.bo" style="text-decoration: none; color: inherit;">1대1문의</a>
				</button>
			</div>
		</div>
		<!-- 상단 메뉴바 끝 -->
		
		<!-- 작성칸 시작 -->
			<br>	
			<hr>
			<div id="fh5co-contact">
				<div class="container">
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-8 animate-box">
							<p class="fs-1">문의글 수정</p>
							<br>
							<form name="inputform" action="qnaUpdateAction.bo?qnaNo=${dto.qnaNo}" method="post">
								<div class="row g-3 align-items-center">
									<div class="col-md-1">
										<h5>제목</h5>
									</div>
									<div class="col-md-11">
										<input type="text" name="qnaTitle" id="qnaTitle" maxlength="33" class="form-control form-control-lg" value="${dto.qnaTitle}" required autofocus>
									</div>
								</div>
								<br>
		
								<div class="row form-group">
									<textarea name="qnaContent" id="qnaContent" cols="30" rows="10" class="form-control form-control-lg" value="${dto.qnaContent}" required>${dto.qnaContent}</textarea>
								</div>
								<br>
								
								<div class="form-group" align="right">
									<input type="submit" value="수정" class="btn btn-warning">
									<input type="reset" value="초기화" class="btn btn-warning">
									<input type="button" value="수정취소" class="btn btn-warning" onclick="window.location='qnaList.bo'">
								</div>
							</form>	
						</div>	
					</div>
				</div>
			</div>
		<!-- 작성칸 끝 -->
	</div>
	
	<!-- footer 시작 -->
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>