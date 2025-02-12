<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product Page</title>
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		
		<!-- 컨텐츠 시작 -->
		<br><br>
		<h3 align="center">상품(추후 개발)</h3>
		<br>
		<br>
			
		<!-- 이벤트카드 목록 시작 -->
		<div class="row" style="width:1000px; margin:auto">
			<div class="col-md-4 ">
				<div class="card" style="width: 18rem;">
					<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">상품명</p>
				    </div>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="card" style="width: 18rem;">
					<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">상품명</p>
				    </div>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="card" style="width: 18rem;">
					<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">상품명</p>
				    </div>
				</div>
			</div>
			
			<br><br><br><br><br><br><br><br><br><br><br>
			
			<div class="col-md-4 ">
				<div class="card" style="width: 18rem;">
					<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">상품명</p>
				    </div>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="card" style="width: 18rem;">
					<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">상품명</p>
				    </div>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="card" style="width: 18rem;">
					<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">상품명</p>
				    </div>
				</div>
			</div>
			
			<br><br><br><br><br><br><br><br><br><br><br>
			
			<div class="col-md-4 ">
				<div class="card" style="width: 18rem;">
					<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">상품명</p>
				    </div>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="card" style="width: 18rem;">
					<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">상품명</p>
				    </div>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="card" style="width: 18rem;">
					<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">상품명</p>
				    </div>
				</div>
			</div>
			
		<br><br><br><br><br><br><br><br><br><br><br>
		</div>
		<!-- 이벤트카드 목록 시작 -->
		
		<!-- 페이지컨트롤 시작 -->
		<div style="width:1000px; margin:auto" >
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item">
					    <a class="page-link" href="#" aria-label="Previous">
					      <span aria-hidden="true">&laquo;</span>
					    </a>
					</li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item">
					    <a class="page-link" href="#" aria-label="Next">
					      <span aria-hidden="true">&raquo;</span>
					    </a>
				    </li>
				</ul>
			</nav>
		</div>
		<!-- 페이지컨트롤 끝 -->
		<!-- 컨텐츠 끝 -->
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>