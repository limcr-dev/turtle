<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" href="${path}/resources/css/common/main.css">

<!-- 챗봇 API 연결 -->
<script>
	Kakao.Channel.createChatButton({
		container: '#chat-channel-button',
		channelPublicId: '_ZeUTxl',
	});
</script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.4/kakao.min.js"
 	 integrity="sha384-DKYJZ8NLiK8MN4/C5P2dtSmLQ4KwPaoqAfyA/DfmEc1VDxu4yyC7wy6K1Hs90nka" crossorigin="anonymous"></script>

<script>
	Kakao.init('c089c8172def97eb00c07217cae17495'); // 사용하려는 앱의 JavaScript 키 입력
</script>
	
<script>
	function chatChannel() {
		Kakao.Channel.chat({
		channelPublicId: '_ZeUTxl',
		});
	}
</script>

</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		
		<!-- 컨텐츠 시작 -->
		<%-- <%@ include file="/WEB-INF/views/common/chatbot.jsp" %> --%>
		
		<br><br><br>
		<center>
			<h3>Welcome to Turtle Gym</h3>
		</center>
		<br>
		<!-- 챗봇 아이콘 -->
		<div align="right" style="margin-right: 10px">
			<a href="https://pf.kakao.com/_AxdTKn/chat">
				<img src="resources/images/chatbot.png" width="50px" height="50px">
			</a>
		</div>
		<br>
		<!-- Components > Carousel > 두번째 예제 => 메인 슬라이딩 페이지 -->
		<div class="container-fluid">
			<div class="row">	
			
			<!-- main 화면 사진 -->
			<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="carouselExampleIndicators" class="carousel slide">
						
						<div class="carousel-indicators">
						    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
						    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
						    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
						    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
						</div>
						
						<!-- 사진 -->
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="${path}/resources/images/temporary/둥이.jpg" width="400px" height="600px" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="${path}/resources/images/temporary/미미.jpg" width="400px" height="600px" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="${path}/resources/images/temporary/뽀뽀.jpg" width="400px" height="600px" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="${path}/resources/images/temporary/완두.jpg" width="400px" height="600px" class="d-block w-100" alt="...">
							</div>
						</div>
						
						<!-- 사진 넘기기 화살표 -->
						<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
		<!-- 컨텐츠 끝 -->
		
		<!-- footer 시작 -->
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
		<!-- footer 끝 -->
	</div>
</body>
</html>