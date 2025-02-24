<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 인증 및 조회</title>

<!-- revConsult.js -->
<script src="${path}/resources/js/reservation/revConsult.js" defer></script>

</head>
<body>
	<div class="wrap">
		<br>
		<div id="fh5co-contact">
			<div class="container">
				<div class="row" style="margin-top:20px">
					<p class="fs-1" align="center">회원 조회 및 인증</p>
					<br><hr><br>	
					
					<form name="searchUserform" action="revConsultCheckUser.do" method="post">
						<!-- 회원 인증 초기 페이지 및 인증 실패 화면 -->
						<c:if test="${dto == null}">
							<!-- 회원 인증 실패 시 알림창 띄우기 -->
							<c:if test="${selectCnt == 0}">
								<script>
								alert("잘못된 비밀번호입니다.")
								</script>
							</c:if>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-12" align="center">
									<span style="color: #ff8000"><b>${userId}</b></span>님 회원 인증 해주세요.
									<input type="hidden" id="userId" name="userId" value="${userId}">
								</div>
							</div>
							<br>
							<div align="center">
								<div class="col-md-8">
									<input type="password" id="userPw" name="userPw" class="form-control form-control-lg" placeholder="비밀번호를 입력하세요" required>
								</div>
							</div>
							<br>
							<div class="form-group" align="right">
								<input type="submit" class="btn btn-dark" value="인증">
								<input type="reset" class="btn btn-dark" value="초기화">
							</div>
						</c:if>
						
						<!-- 회원 인증 성공 -->
						<c:if test="${selectCnt == 1}">
							<div class="row g-3 align-items-center">
								<div class="col-md-12" align="center">
									<span style="color: #ff8000"><b>${userId}</b></span>님 인증 성공했습니다.
								</div>
							</div>
							<br>
							
							<div class="form-group" align="right">
								<input type="button" class="btn btn-dark" value="확인" onclick="setUser('${dto.userId}', '${dto.userName}','${dto.userHp}')">
							</div>
						</c:if>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 컨텐츠 끝 -->

</body>
</html>