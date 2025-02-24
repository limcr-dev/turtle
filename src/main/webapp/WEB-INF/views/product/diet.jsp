<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>터틀짐 헬스 회원 식단 관리</title>

<!-- join.js -->
<script src="${path}/resources/js/join/join.js" defer></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
function diet_menu() {

	const goal = document.getElementById('goal').value;
	const exe_level = document.getElementById('exe_level').value;
	const calorie = document.getElementById('calorie').value;
	const allergy = document.getElementById('allergy').value;
	const others = document.getElementById('others').value;
	
	let param = {'goal': goal, 'exe_level': exe_level, 'calorie' : calorie, 'allergy' : allergy, 'others' : others}
		
    $.ajax({
        type: 'POST',
        contentType: 'application/json',
        url: 'http://localhost:5000/turtle/products/diet_menu',
        data: JSON.stringify(param),
        success: function(response) {
            $("#diet_plan").html(response)
        },
        error: function(){
        	alert('오류');
        }
    });
}

</script>
 
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
						<p class="fs-1">터틀짐 헬스 식단 관리</p>
						<br>
						<form name="inputform" method="post" onsubmit="">
							
							<div class="row g-3 align-items-center">
								<div class="col-md-12">
									헬스 목표가 무엇인가요?
								</div>
								<br>
								<div class="col-md-4">
								  <label class="visually-hidden" for="specificSizeSelect">Goal</label>
								  <select class="form-select  form-select-lg" id="goal" name="goal">
								    <option selected>목표 선택</option>
								    <option value="체중 감량">체중 감량</option>
								    <option value="근육 증가">근육 증가</option>
								    <option value="건강 유지">건강 유지</option>
								    <option value="체력 향상">체력 향상</option>
								  </select>
								</div>
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-12">
									운동 강도는 어떤가요?
								</div>
								<br>
								<div class="col-md-4">
								  <label class="visually-hidden" for="specificSizeSelect">Exercise_level</label>
								  <select class="form-select  form-select-lg" id="exe_level" name="exe_level">
								    <option selected>운동 강도</option>
								    <option value="저강도 운동">저강도 운동</option>
								    <option value="중강도 운동">중강도 운동</option>
								    <option value="고강도 운동">고강도 운동</option>
								  </select>
								</div>
							</div>
							<br>
							<div class="row g-3 align-items-center">
								<div class="col-md-12">
									하루 중 섭취해야 할 총 목표 칼로리가 있으신가요?
								</div>
								<br>
								<div class="col-md-4">
								  <label class="visually-hidden" for="specificSizeSelect">Calorie</label>
								  <select class="form-select  form-select-lg" id="calorie" name="calorie">
								    <option selected>목표 칼로리</option>
								    <option value="1200">1200 kcal</option>
								    <option value="1400">1400 kcal</option>
								    <option value="1600">1600 kcal</option>
								    <option value="1800">1800 kcal</option>
								    <option value="2000">2000 kcal</option>
								    <option value="2200">2200 kcal</option>
								    <option value="2400">2400 kcal</option>
								    <option value="2600">2600 kcal</option>
								    <option value="2800">2800 kcal</option>
								    <option value="3000">3000 kcal</option>
								  </select>
								</div>
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-12">
									알레르기를 유발하는 피해야 할 음식이 있으신가요?
								</div>
								<br>
								<div class="col-md-8">
								  <label class="visually-hidden" for="specificSizeSelect">Allergy</label>
								  <select class="form-select  form-select-lg" id="allergy" name="allergy">
								    <option selected>알레르기 식품 종류</option>
								    <option value="난류(계란, 메추리알 등)">난류(계란, 메추리알 등)</option>
								    <option value="곡류(대두, 메밀, 밀 등)">곡류(대두, 메밀, 밀 등)</option>
								    <option value="갑각류(게, 새우 등)">갑각류(게, 새우 등)</option>
								    <option value="견과류(땅콩, 호두, 잣 등)">견과류(땅콩, 호두, 잣 등)</option>
								    <option value="생선류(고등어 등)">생선류(고등어 등)</option>
								    <option value="아황산류 및 아질산류(햄, 소시지 등)">아황산류 및 아질산류(햄, 소시지 등)</option>
								    <option value="연체류(오징어, 조개, 굴, 전복, 홍합 등)">연체류(오징어, 조개, 굴, 전복, 홍합 등)</option>
								    <option value="육류(닭고기, 돼지고기, 쇠고기 등),">육류(닭고기, 돼지고기, 쇠고기 등)</option>
								    <option value="과일(복숭아, 자두, 키위 등)">과일(복숭아, 자두, 키위 등)</option>
								  </select>
								</div>
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-12">
									헬스 식단에 포함할 다른 내용이 있으시면 다음 칸에 적어주세요.
								</div>
								<br>
								<div class="col-md-8">
								  <label class="visually-hidden" for="specificSizeSelect">Allergy</label>
								  <input type="text" id="others" name="others" class="form-control form-control-lg" name="roadFullAddr" >
								</div>
							</div>
							<br>														
							<br>							
							<div class="form-group" align="right">
								<input type="button" value="식단 확인" class="btn btn-dark" onclick="diet_menu()">
								<input type="reset" value="초기화" class="btn btn-dark">
								<input type="button" value="메인 화면으로" class="btn btn-dark" onclick="window.location='${path}/main.do'">
							</div>
							<br>
							<br>
							<div class="row form-group">
								<!-- <label for="message">Message</label> -->
								<textarea name="diet_plan" id="diet_plan" cols="30" rows="20" class="form-control form-control-lg" placeholder="최신 트랜드로 회원님의 요청에 따른 맞춤 식단을 제공해 드립니다."></textarea>
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