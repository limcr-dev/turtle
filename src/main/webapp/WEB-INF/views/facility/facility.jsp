<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>facility Page</title>
</head>
<body>
	<div class="wrap">
	<!-- header 시작 -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<!-- header 끝 -->
		<br><br>
		<h3 align="center">내부시설</h3>
		<br>
		<br>
		
		<!-- 이벤트카드 목록 시작 -->
		<div class="row" style="width:1000px; margin:auto">
			<div class="col-md-4 ">
				<div class="card" style="width: 18rem;">
					<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">웨이트존</p>
				    </div>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="card" style="width: 18rem;">
					<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">유산소존</p>
				    </div>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="card" style="width: 18rem;">
					<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">PT룸</p>
				    </div>
				</div>
			</div>
			
			<br><br><br><br><br><br><br><br><br><br><br>
			
			<div class="col-md-4 ">
				<div class="card" style="width: 18rem;">
					<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">GX룸</p>
				    </div>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="card" style="width: 18rem;">
					<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">탈의실</p>
				    </div>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="card" style="width: 18rem;">
					<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">샤워장</p>
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