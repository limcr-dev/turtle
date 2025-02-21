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
			<br><br>
			<h3 align="center">프로그램</h3>
			<br>
			<br>
			
			<!-- 이벤트카드 목록 시작 -->
			<div class="row" style="width:1000px; margin:auto">
				<div class="col-md-4 ">
					<div class="card" style="width: 18rem;">
						<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
						<div class="card-body">
							<p class="card-text">헬스</p>
					    </div>
					</div>
				</div>
				<div class="col-md-4 ">
					<div class="card" style="width: 18rem;">
						<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
						<div class="card-body">
							<p class="card-text">PT</p>
					    </div>
					</div>
				</div>
				<div class="col-md-4 ">
					<div class="card" style="width: 18rem;">
						<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
						<div class="card-body">
							<p class="card-text">요가</p>
					    </div>
					</div>
				</div>
				
				<br><br><br><br><br><br><br><br><br><br><br>
				
				<div class="col-md-4 ">
					<div class="card" style="width: 18rem;">
						<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
						<div class="card-body">
							<p class="card-text">스피닝</p>
					    </div>
					</div>
				</div>
				<div class="col-md-4 ">
					<div class="card" style="width: 18rem;">
						<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
						<div class="card-body">
							<p class="card-text">줌바</p>
					    </div>
					</div>
				</div>
				<div class="col-md-4 ">
					<div class="card" style="width: 18rem;">
						<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
						<div class="card-body">
							<p class="card-text">필라테스</p>
					    </div>
					</div>
				</div>
			<!-- 컨텐츠 끝 -->
		</div>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>