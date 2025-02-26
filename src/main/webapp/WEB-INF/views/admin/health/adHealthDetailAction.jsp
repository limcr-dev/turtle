<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬스 회원 상세 정보</title>

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
				<div class="row">
					<div class="col-md-2">
					</div>		
					<div class="col-md-8 animate-box">
						<p class="fs-1" align="center">헬스 회원 상세 정보</p>
						<br>
					
					<form name="inputform" action="adHealthUpdateAction.ad" method="post" enctype="multipart/form-data">
					<hr>
					<div class="row g-3 align-items-center">
						<div class="col-md-2">
							회원 번호 
						</div>
						<div class="col-md-5">
							<p class="fs-4">${dto.healthNo}</p>
						</div>
						<br>
						<div class="col-md-5" align="center">
							<img src = "${dto.healthImg}" style="width:200px" alt="이미지를 등록해주세요"><br>
						</div>
					</div>
					
					<br>
					<div class="row g-3 align-items-center">
						<div class="col-md-2">
							아이디
						</div>
						<div class="col-md-5">
							<p class="fs-4">${dto.userId}</p>
						</div>
						<div class="col-md-5">
						 <p align="center"><span id="dateDifference"></span></p>
						</div>
					</div>
					<br>
					
					<div class="row g-3 align-items-center">
						<div class="col-md-2">
							이름
						</div>
						<div class="col-md-10">
							<input type="text" id="userName" name="userName" value="${dto.userName}" class="form-control  form-control-lg" placeholder="이름을 입력하세요" required>
						</div>
					</div>
					<br>
					
					<div class="row g-3 align-items-center">
						<div class="col-md-2">
							전화번호
						</div>
						
					<div class="col-md-2">
					    <c:choose>
					        <c:when test="${empty dto.getUserHp()}">
					            <input type="text" id="userHp1" name="userHp1" class="form-control form-control-lg">
					        </c:when>
					        <c:otherwise>
					            <c:set var="hpArr" value="${fn:split(dto.getUserHp(),'-')}" />
					            <input type="text" id="userHp1" name="userHp1" class="form-control form-control-lg" value="${hpArr[0]}">
					        </c:otherwise>
					    </c:choose>
					</div>
						
					<div class="col-md-1 text-center">-</div>
						
					<div class="col-md-3">
					    <c:choose>
					        <c:when test="${empty dto.getUserHp()}">
					            <input type="text" id="userHp2" name="userHp2" class="form-control form-control-lg">
					        </c:when>
					        <c:otherwise>
					            <input type="text" id="userHp2" name="userHp2" class="form-control form-control-lg" value="${hpArr[1]}">
					        </c:otherwise>
					    </c:choose>
					</div>
						
					<div class="col-md-1 text-center">-</div>
						
					<div class="col-md-3">
					    <c:choose>
					        <c:when test="${empty dto.getUserHp()}">
					            <input type="text" id="userHp3" name="userHp3" class="form-control form-control-lg">
					        </c:when>
					        <c:otherwise>
					            <input type="text" id="userHp3" name="userHp3" class="form-control form-control-lg" value="${hpArr[2]}">
					        </c:otherwise>
					    </c:choose>
					</div>
						
					</div>
					<br>
					
					<div class="row g-3 align-items-center">
						<div class="col-md-2">
							회원 이미지
						</div>
						<div class="col-md-10">
							<input type="file" id="hmImg" name="hmImg" value="${dto.healthImg}" class="form-control  form-control-lg" accept="image/*">
						</div>
					</div>
					<br>
				
					<div class="col-md-10 d-flex align-items-center gap-3">
					  <div class="form-check">
					    <input class="form-check-input" type="radio" name="healthStatus" id="healthStatus1" value="헬스" 
					      onchange="toggleInputs()" 
					      <c:if test="${dto.healthStatus == '헬스'}">checked</c:if>>
					    <label class="form-check-label" for="healthStatus1">헬스</label>
					  </div>
					  <div class="form-check">
					    <input class="form-check-input" type="radio" name="healthStatus" id="healthStatus2" value="PT" 
					      onchange="toggleInputs()" 
					      <c:if test="${dto.healthStatus == 'PT'}">checked</c:if>>
					    <label class="form-check-label" for="healthStatus2">P.T</label>
					  </div>
					</div>
					
					<hr><br>
					<!-- 등록 기간 (헬스 선택 시) -->
					<div class="row g-3 align-items-center" id="dateInputRow" style="display: none;">
					  <div class="col-md-2">
					    등록 기간
					  </div>
					  
					  <div class="col-md-5 d-flex align-items-center gap-2">
					    <input type="date" value="${dto.healthStartDate}" id="healthStartDate" name="healthStartDate" class="form-control form-control-lg">
					    <span>~</span>
					    <input type="date" value="${dto.healthEndDate}" id="healthEndDate" name="healthEndDate" class="form-control form-control-lg">
					  </div>
					</div>
							
					<!-- 등록 기간 자동 설정 버튼 -->
					<br>
						
					<!-- 선생님 선택 (P.T 선택 시) -->
					<div class="row g-3 align-items-center" id="trainerRow" style="display: none;">
					  <div class="col-md-2">
					    P.T 선생님
					  </div>
					  <div class="col-md-5 d-flex align-items-center gap-2">
					    <select class="form-select form-select-lg" name="trainerId" id="trainerId">
					    	<option value="">선택</option>
						     <c:forEach var="userId" items="${list}">
						        <option value="${userId}" <c:if test="${dto.trainerId == userId}">selected="selected"</c:if>>${userId}</option>
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
						    <option value=0>${dto.ptCnt}회</option>
							<option value=12>12회</option>
							<option value=24>24회</option>
							<option value=36>36회</option>
						  </select>
						</div>
					</div>
					<br>
			
					<div class="form-group" align="right">
				        <input class="btn btn-light" type="submit" value="수정">
						<input class="btn btn-light" type="button" value="회원목록" onclick="window.location='${path}/adHealthList.ad'">
						
						<input type="hidden" name="hiddenPageNum" value="${pageNum}"/>
               			<input type="hidden" name="hiddenHealthNo" value="${dto.healthNo}"/>
               			<input type="hidden" name="hiddenHmImg" value="${dto.healthImg}"/> 
					</div>		
					</form>
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
