<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬스 회원 등록</title>

<!-- join.js -->
<script src="${path}/resources/js/health/insert.js" defer></script>
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		<br>
		<div id="fh5co-contact">
		
			<div class="container">
				<div id="contents">
				<div class="row">
					<div class="col-md-2">
					</div>		
					<div class="col-md-8 animate-box">
						<p class="fs-1" align="center">헬스 회원 등록</p>
						<br>
						
						<form name="inputform" action="adHealthInsertAction.ad" method="post" enctype="multipart/form-data"
						onsubmit="return signInCheck()">
							
							<input type="hidden" name="hiddenSearchId" value="0">
							
							<input type="hidden" name="hiddenUserid" value="">
							<input type="hidden" name="hiddenuserName" value="">
							<input type="hidden" name="hiddenuserHp" value="">
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									아이디
								</div>
								<div class="col-md-8">
									<input type="text" name="userId" id="userId" class="form-control form-control-lg" placeholder="아이디를 입력하세요" required autofocus>
								</div>
								<div class="col-md-2">
									<input type="button" class="btn btn-light" name="dubChk" value="아이디 조회" onclick="searchId()">
								</div>
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									이름
								</div>
								<div class="col-md-10">
									<input type="text" id="userName" name="userName" class="form-control  form-control-lg" disabled>
								</div>
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									전화번호
								</div>
								<div class="col-md-10">
									<input type="text" id="userHp" name="userHp" class="form-control form-control-lg" disabled>
								</div>
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									회원 이미지
								</div>
								<div class="col-md-10">
									<input type="file" id="hmImg" name="hmImg" class="form-control  form-control-lg" accept="image/*" required>
								</div>
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
							  <div class="col-md-2">상태</div>
							  <div class="col-md-10 d-flex align-items-center gap-3">
							    <div class="form-check">
							      <input class="form-check-input" type="radio" name="healthStatus" id="healthStatus1" value="헬스" onchange="toggleInputs()">
							      <label class="form-check-label" for="healthStatus1">헬스</label>
							    </div>
							    <div class="form-check">
							      <input class="form-check-input" type="radio" name="healthStatus" id="healthStatus2" value="PT" onchange="toggleInputs()">
							      <label class="form-check-label" for="healthStatus2">P.T</label>
							    </div>
							  </div>
							</div>
							
							<hr><br>
							
							<!-- 등록 기간 -->
							<div class="row g-3 align-items-center" id="dateInputRow" style="display: none;">
							  <div class="col-md-2">등록 기간</div>
							  <div class="col-md-5 d-flex align-items-center gap-2">
							    <input type="date" id="healthStartDate" name="healthStartDate" class="form-control form-control-lg" onchange="calculateDays()">
							    <span>~</span>
							    <input type="date" id="healthEndDate" name="healthEndDate" class="form-control form-control-lg" onchange="calculateDays()">
							  </div>
							  
							</div>
							
							<br>
							
							<!-- P.T 선생님 선택 -->
							<div class="row g-3 align-items-center" id="trainerRow" style="display: none;">
							  <div class="col-md-2">P.T 선생님</div>
							  <div class="col-md-5 d-flex align-items-center gap-2">
							    <select class="form-select form-select-lg" name="trainerId" id="trainerId">
							      <option value="">선택</option>
							      <c:forEach var="userId" items="${list}">
							        <option value="${userId}">${userId}</option>
							      </c:forEach>
							    </select>
							  </div>
							</div>
							
							<br>
							
							<!-- P.T 등록 횟수 -->
							<div class="row g-3 align-items-center" id="ptCountRow" style="display: none;">
							  <div class="col-md-2">P.T 등록 횟수</div>
							  <div class="col-md-3">
							    <select class="form-select form-select-lg" id="ptCnt" name="ptCnt">
							      <option value="0">횟수</option>
							      <option value="12">12회</option>
							      <option value="24">24회</option>
							      <option value="36">36회</option>
							    </select>
							  </div>
							</div>
							
							<div class="form-group" align="right">
								<input class="btn btn-light" type="submit" value="등록">
								<input class="btn btn-light" type="reset" value="초기화">
								<input class="btn btn-light" type="button" value="회원목록" onclick="window.location='${path}/adHealthList.ad'"> 
							</div>					
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	
<br>
		
<!-- footer 시작 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- footer 끝 -->
</body>
</html>