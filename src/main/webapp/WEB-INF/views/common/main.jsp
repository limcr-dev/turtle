<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>

<script type="text/javascript">
	  function openChat(){
	    var chat_window = window.open("http://localhost:8501", "Turtle Gym Chatbot", "top=600,left=1000,width=450px,height=600px,scrollbars=yes", "popup");
	  }
</script>


</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		
		<div class="area_black" style="background-color:black;">	<!-- 블랙 메인 구역 -->
			<div class="btn_chatbot">
				<img src="resources/images/chatbot.png" style="width :200px; height : 200px;" onclick="openChat()" />
			</div>
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
							    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
							</div>
							
							<!-- 사진 -->
							<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
							  <div class="carousel-inner">
							    <div class="carousel-item active" data-bs-interval="3000">
							      <img src="${path}/resources/images/temporary/002.jpg" width="400px" height="500px" alt="...">
							    </div>
							    <div class="carousel-item" data-bs-interval="3000">
							      <img src="${path}/resources/images/temporary/001.jpg" width="400px" height="500px" class="d-block w-100" alt="...">
							    </div>
							    <div class="carousel-item" data-bs-interval="3000">
							      <img src="${path}/resources/images/temporary/005.jpg" width="400px" height="500px" class="d-block w-100" alt="...">
							    </div>
							    <div class="carousel-item" data-bs-interval="3000">
							      <img src="${path}/resources/images/temporary/003.jpg" width="400px" height="500px" class="d-block w-100" alt="...">
							    </div>
							    <div class="carousel-item" data-bs-interval="3000">
							      <img src="${path}/resources/images/temporary/004.jpg" width="400px" height="500px" class="d-block w-100" alt="...">
							    </div>
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
		</div>		
		
		<!-- 하단~ -->
		
		
	
		<!-- 하단 주요 메인 랜딩 -->
		<div class="content_main">
			
			<a class="content_sub" href="${path}/programList.do">
				<img width="150px" height="200px" src="resources/images/two-boxing-gloves.svg"><br><span id="main_category-text">프로그램</span></a>
			
			<a class="content_sub" href="${path}/facility.do">
				<img width="150px" height="200px" src="resources/images/exercise.svg"><br><span id="main_category-text">내부시설</span></a>
				
			<a class="content_sub" href="${path}/reservation.do">
				<img width="150px" height="200px" src="resources/images/dumbbell.svg"><br><span id="main_category-text">예약</span></a>
		</div>
		
		<!-- 하단 홍보영상 -->
		<div align="center" style="background-color:#262626;">
			<video src="${path}/resources/images/turttlegym_.mp4" width="1000" muted autoplay loop controls></video>
		</div>
		
		<!-- 하단 오시는길 -->
		<div align="center">
			<img src="${path}/resources/images/MAP.jpg" width="640px" height="100px" />
				
			<!-- 카카오맵 - 약도서비스 -->
			<!-- 1. 약도 노드 -->
			<div id="daumRoughmapContainer1739782438517" class="root_daum_roughmap root_daum_roughmap_landing">
			
			<!-- 2. 설치 스크립트 -->
			<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
			
			<!-- 3. 실행 스크립트 -->
			<script charset="UTF-8">
				new daum.roughmap.Lander({
					"timestamp" : "1739782438517",
					"key" : "2n3f2",
					"mapWidth" : "640",
					"mapHeight" : "360"
				}).render();
			</script>
			</div>
		</div>
		<!-- 하단끝 -->
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>