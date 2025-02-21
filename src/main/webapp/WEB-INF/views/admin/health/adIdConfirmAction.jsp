<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 조회</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/customer/join.css">

<!-- join.js -->
<script src="${path}/resources/js/health/insert.js" defer></script>

</head>
<body>
	<div class="wrap">
		<br>
		<div id="fh5co-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
					</div>
					<div class="col-md-6 animate-box">
						<p class="fs-1">아이디 조회</p>
						<br>		
						<form name="confirmform" action="adIdConfirmAction.ad" method="post">
							
							<!-- id 조회가 안되었을 때 -->
							<c:if test="${dto == null}">
							<div class="row g-3 align-items-center">
								<div class="col-md-12" align="center">
									<span style="color: #ff8000"><b>${userId}</b></span>를 조회 할 수 없습니다.
									<br><br><br>
								</div>
							</div>
							<div class="row g-3 align-items-center">
								<div class="col-md-3" >
									아이디
								</div>
								<div class="col-md-9">
									<input type="text" id="userId" name="userId" class="form-control form-control-lg" placeholder="아이디를 입력하세요" required autofocus>
								</div>
							</div>
							<br>
							<div class="form-group" align="right">
								<input type="submit" class="btn btn-light" value="확인">
								<input type="reset" class="btn btn-light" value="초기화">
							</div>
							</c:if>
							
							<!-- id 조회 되었을 때 -->
							<c:if test="${dto != null}">
							<div class="row g-3 align-items-center">
								<div class="col-md-12" align="center">
									<span style="color: #ff8000"><b>${userId}</b></span>를 선택하시겠습니까?
									<br><br><br>
								</div>
							</div>
							<br>
							<div class="form-group" align="right">
								<input type="button" class="btn btn-light" value="확인" onclick="setUserid('${dto.userId}', '${dto.userName}', '${dto.userHp}')">
							</div>
							</c:if>
							
						</form>
					</div>
				</div>
			</div>
		
		</div>
	</div>
</body>
</html>