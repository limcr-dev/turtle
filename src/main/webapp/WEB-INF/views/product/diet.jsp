<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 식단 관리</title>

<!-- join.js -->
<script src="${path}/resources/js/join/join.js" defer></script>
</head>

<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		<br>	
		<div id="fh5co-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-2">
					</div>
					<div class="col-md-8 animate-box">
						<p class="fs-1">회원 식단 관리</p>
						<br>
						<form name="inputform" action="joinAction.do" method="post"
							onsubmit="return signInCheck()">
							
							<!-- 중복확인 -->
							<input type="hidden" name="hiddenUserid" value="0">
							<input type="hidden" name="hiddenUserEmail" value="0">
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									헬스 목표가 무엇인가요?
								</div>
								<br>
								<div class="col-md-8">
									<input type="text" name="goal" id="goal" class="form-control form-control-lg" placeholder="헬스 목표를 알려주세요." required autofocus>
								</div>
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									운동 강도는 어떤가요?
								</div>
								<br>
								<div class="col-md-10">
									<input type="text" name="exe_level" id="exe_level" class="form-control form-control-lg" placeholder="운동 강도를 알려주세요." required>
								</div>
							</div>
							<br>
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									하루 중 섭취해야 할 총 목표 칼로리가 있으신가요?
								</div>
								<br>
								<div class="col-md-10">
									<input type="text" id="calorie" name="calorie" class="form-control  form-control-lg" placeholder="하루 섭취 목표 칼로리를 알려주세요." required>
								</div>
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									특별히 선호하는 음식이나 피해야 할 음식이 있으신가요?
								</div>
								<br>
								<div class="col-md-6">
								 	<input type="radio" class="btn-check" name="userGender" id="M" value="M" autocomplete="off" required>
									 	<label class="btn btn-outline-secondary" for="M"> 
									 		&nbsp; &nbsp; &nbsp; &nbsp; M (남) &nbsp; &nbsp; &nbsp; &nbsp; 
									 	</label> &nbsp; &nbsp;&nbsp; 
									<input type="radio" class="btn-check" name="userGender" id="F" value="F" autocomplete="off" required>
								 		<label class="btn btn-outline-secondary" for="F"> 
								 			&nbsp; &nbsp; &nbsp; &nbsp;F (여)  &nbsp; &nbsp; &nbsp; &nbsp; 
								 		</label>
								</div>
							</div>
							<br>
							<div class="row form-group">
								<!-- <label for="message">Message</label> -->
								<textarea name="message" id="message" cols="30" rows="10" class="form-control form-control-lg" placeholder="체형에 대한 고민을 작성해주세요"></textarea>
							</div>
							<br>
							
							<div class="form-group" align="right">
								<input type="submit" value="식단 확인" class="btn btn-dark">
								<input type="reset" value="초기화" class="btn btn-dark">
								<input type="button" value="메인 화면으로" class="btn btn-dark" onclick="window.location='${path}/main.do'">
							</div>
						</form>	
					</div>	
				</div>
			</div>
			<div class="col-md-2">
			</div>	
		</div>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>