<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ Insert</title>
</head>

<body>
	<div class="wrap">
		<!-- header 시작 -->
			<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		<div class="container">
			<div id="contents">
				<!-- 상단 중앙 시작 -->
				<div>
					<hr>
					<h1 align="center">FAQ 작성</h1>
					<hr>
				</div>
				<!-- 상단 중앙 종료 -->
				<div id="section2" style="width:1100px; margin:auto;">
					<div class="row">
						<!-- 좌측 메뉴 시작 --> 
						<div class="col-md-2">           					
							<%@ include file= "/WEB-INF/views/admin/common/adMainLeft.jsp" %>
						</div>
						<!-- 좌측메뉴 종료 -->
						<!-- 작성칸 시작 -->
						<div class="col-md-10">
							<form name="inputform" action="adFaqInsertAction.ad" method="post" style="width:800px; margin:auto;">
								<div class="row g-3 align-items-center">
									<div class="col-md-2">
										<h5>제목</h5>
									</div>
									<div class="col-md-8">
										<input type="text" name="faqTitle" id="faqTitle" class="form-control form-control-lg" placeholder="제목을 입력하세요" required autofocus>
									</div>
								</div>
								<br>
		
								<div class="row form-group">
									<textarea name="faqContent" id="faqContent" cols="30" rows="10" class="form-control form-control-lg" placeholder="내용을 입력해주세요" required></textarea>
								</div>
								<br>
								
								<div class="form-group" align="right">
									<select  name="category" id="category" required>
										<option value=""
											<c:if test="${category == ''}">selected="selected"</c:if>>FAQ타입</option>
										<option value="예약관련"
											<c:if test="${category == '예약관련'}">selected="selected"</c:if>>예약관련</option>
										<option value="로그인관련"
											<c:if test="${category == '로그인관련'}">selected="selected"</c:if>>로그인/회원가입 관련</option>
										<option value="시설관련"
											<c:if test="${category == '시설관련'}">selected="selected"</c:if>>시설관련</option>
										<option value="프로그램관련"
											<c:if test="${category == '프로그램관련'}">selected="selected"</c:if>>프로그램 관련</option>
										<option value="상품관련"
											<c:if test="${category == '상품관련'}">selected="selected"</c:if>>상품관련</option>
									</select>
									<input type="submit" value="작성" class="btn active">
									<input type="reset" value="초기화" class="btn active">
									<input type="button" value="작성취소" class="btn active" onclick="window.location='adFaqList.ad'">
								</div>
							</form>	
						</div>	
						<!-- 작성칸 끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>