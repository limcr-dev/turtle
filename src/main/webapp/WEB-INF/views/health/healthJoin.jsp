<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adHealthJoin</title>

<!-- join.js -->
<script src="${path}/resources/js/health/join.js" defer></script>
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		<br>
		<!-- 세션이 없는 경우 : 예약 불가로 alert창 띄운 후, 로그인 페이지로 이동 -->
      <c:if test="${sessionScope.sessionID == null}">
         <script type="text/javascript">
            alert("로그인 후 이용해주세요.");
            window.location="${path}/login.do"
         </script>
      </c:if>
      
     <!-- 세션이 있는 경우 : 예약 가능 -->
	<c:if test="${sessionScope.sessionID != null}">
		<c:if test="${selectCnt != 0}">
			<script type="text/javascript">
				alert("이미 등록된 회원입니다.");
				window.location="${path}/main.do"
			</script>
		</c:if>
		
		<c:if test="${selectCnt == 0}">
			<div id="fh5co-contact">
				<div class="container">
					<div class="row">
						<div class="col-md-2">
						</div>
						<div class="col-md-8 animate-box">
							<p class="fs-1" align="center">헬스 등록신청</p>
							<br>
							
							<form name="inputform" action="healthJoinAction.do" method="post" enctype="multipart/form-data"
							onsubmit="return signInCheck()">
								
								<input type="hidden" name="hiddenSearchId" value="0">
								
								<input type="hidden" name="hiddenUserid" value="">
								<input type="hidden" name="hiddenuserName" value="">
								<input type="hidden" name="hiddenuserHp" value="">
								<div align="right">
									<p style= "color:gray">* 결제 후에 헬스장 이용이 가능합니다</p>
								</div>
								
								<div class="row g-3 align-items-center">
									<div class="col-md-2">
										아이디
									</div>
									<div class="col-md-8">
										<input type="text" name="userId" id="userId" class="form-control form-control-lg" value="${sessionID}" readonly>
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
								
								<div class="row g-3 align-items-center" id="dateInputRow"  style="display: none;">
								 
								  <div class="col-md-2">등록 기간</div>
								  <!-- 등록 기간 자동 설정 버튼 -->
								  <div class="row g-3 align-items-center" id="autoDateButtons">
								    <div class="col-md-2"></div>
								    <div class="col-md-10">
								      <button type="button" class="btn btn-light" onclick="setAutoDate(3)">3개월</button>
								      <button type="button" class="btn btn-light" onclick="setAutoDate(6)">6개월</button>
								      <button type="button" class="btn btn-light" onclick="setAutoDate(12)">12개월</button>
								    </div>
								  </div>
								
								  <!-- 시작일 & 종료일 입력 -->
								  <div class="col-md-5 d-flex align-items-center gap-2">
								    <input type="date" id="healthStartDate" name="healthStartDate" class="form-control form-control-lg">
								    <span>~</span>
								    <input type="date" id="healthEndDate" name="healthEndDate" class="form-control form-control-lg" readonly onchange="calculateDateDifference()">
								  </div>
								</div>
								<br>
								
								<!-- 선생님 선택 (P.T 선택 시) -->
								<div class="row g-3 align-items-center" id="trainerRow" style="display: none;">
								  <div class="col-md-2">
								    P.T 선생님
								  </div>
								  <div class="col-md-5 d-flex align-items-center gap-2">
								    <select class="form-select form-select-lg" name="trainerId" id="trainerId">
								      <option value="0">선택</option>
								      <c:forEach var="list" items="${list}">
								        <option value="${list.userId}">${list.userId}</option>
								      </c:forEach>
								    </select>
								  </div>
								</div>
								
								<!-- P.T 등록 횟수 (P.T 선택 시) -->
								<br>
								<div class="row g-3 align-items-center" id="ptCountRow" style="display: none;">
									<div class="col-md-2">
										P.T 등록 횟수
									</div>
									<div class="col-md-3">
									  <label class="visually-hidden" for="specificSizeSelect">Preference</label>
									  <select class="form-select  form-select-lg" id="ptCnt" name="ptCnt">
									    <option value=0>횟수</option>
										<option value=12>12회</option>
										<option value=24>24회</option>
										<option value=36>36회</option>
									  </select>
									</div>
								</div>
								<br>
								
								<div class="form-group" align="right">
									<input class="btn btn-light" type="submit" value="등록">
									<input class="btn btn-light" type="reset" value="초기화">
									<input class="btn btn-light" type="button" value="메인" onclick="window.location='${path}/main.do'"> 
								</div>					
							</form>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</c:if>
	</div>
	
		<br>
		
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>