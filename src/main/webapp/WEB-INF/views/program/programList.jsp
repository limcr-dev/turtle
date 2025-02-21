<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>program Page</title>
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
			
			<!-- 상단 중앙1 시작 -->
				<div>
					<hr>
					<h1 align="center">프로그램 안내</h1>
					<hr>
				</div>
			<!-- 상단 중앙1 종료 -->
			
			<!-- 상당 중앙2 시작 -->
			<div id="section2">
				<!-- 프로그램 안내 목록 -->
				<div class="container">
			   		<div class="row col-4">
			     		<div class="card" style="width: 100%;">
			        		<img src="..." class="card-img-top" alt="...">
					        <div class="card-body">
					          <h5 class="programTitle">Card title</h5>
					          <p class="programComment">Some quick example text.</p>
					          <a href="#" class="btn btn-primary">등록하기</a>
					        </div>
			     		 </div>
			  		</div>
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