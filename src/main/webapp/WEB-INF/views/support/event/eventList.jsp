<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event Page</title>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">

</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		
		<!-- 컨텐츠 시작 -->
			<!-- 상단 메뉴바 -->
				<br>
				<div  style="width:1000px; margin:auto" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
					<div class="btn-group me-2" role="group" aria-label="Second group">
					    <button type="button" class="btn btn-light">
							<a href="${path}/noticeList.bo" style="text-decoration: none; color: inherit;">공지사항</a>
						</button>
						<button type="button" class="btn btn-warning">
							<a href="${path}/eventList.bo" style="text-decoration: none; color: inherit;">이벤트</a>
						</button>
						<button type="button" class="btn btn-light">
							<a href="${path}/boardList.bo" style="text-decoration: none; color: inherit;">자유게시판</a>
						</button>
					    <button type="button" class="btn btn-light" >
							<a href="${path}/faqList.bo" style="text-decoration: none; color: inherit;"> FAQ</a>
					    </button>
					    <button type="button" class="btn btn-light" >
							<a href="${path}/qnaList.bo" style="text-decoration: none; color: inherit;">1대1문의</a>
						</button>
					</div>
				</div>
			<!-- 상단 메뉴바 끝 -->
			
			<hr>
			<h3 align="center">이벤트</h3>
			<br>
			<br>
			
			<!-- 이벤트카드 목록 시작 -->
				<div class="row" style="width:1000px; margin:auto">
					<div class="col-md-4 ">
						<div class="card" style="width: 18rem;">
							<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text">지금 결제하면 만원!</p>
						    </div>
						</div>
					</div>
					<div class="col-md-4 ">
						<div class="card" style="width: 18rem;">
							<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text">지금 결제하면 만원!</p>
						    </div>
						</div>
					</div>
					<div class="col-md-4 ">
						<div class="card" style="width: 18rem;">
							<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text">지금 결제하면 만원!</p>
						    </div>
						</div>
					</div>
					
					<br><br><br><br><br><br><br><br><br><br><br>
					
					<div class="col-md-4 ">
						<div class="card" style="width: 18rem;">
							<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text">지금 결제하면 만원!</p>
						    </div>
						</div>
					</div>
					<div class="col-md-4 ">
						<div class="card" style="width: 18rem;">
							<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text">지금 결제하면 만원!</p>
						    </div>
						</div>
					</div>
					<div class="col-md-4 ">
						<div class="card" style="width: 18rem;">
							<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text">지금 결제하면 만원!</p>
						    </div>
						</div>
					</div>
					
					<br><br><br><br><br><br><br><br><br><br><br>
					
					<div class="col-md-4 ">
						<div class="card" style="width: 18rem;">
							<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text">지금 결제하면 만원!</p>
						    </div>
						</div>
					</div>
					<div class="col-md-4 ">
						<div class="card" style="width: 18rem;">
							<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text">지금 결제하면 만원!</p>
						    </div>
						</div>
					</div>
					<div class="col-md-4 ">
						<div class="card" style="width: 18rem;">
							<img src="./resources/images/gallery-1.jpg" height="180px" class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text">지금 결제하면 만원!</p>
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
		<p align="center">
			SELECT *<br>
				FROM event_tb<br>
				WHERE eventNo = eventNo <br>
				AND eventShow = 'Y' <br>
				AND eventNo >= start <br>
				AND eventNo <= end <br>
		</p>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>