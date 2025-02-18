<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

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
				<div class="row g-3 align-items-center">
					<div class="col-md-12" align="center">
						<span style="color: #ff8000"><b>${sessionScope.sessionID}</b></span>님 환영합니다!
					</div>
				</div>
				<div class="col-md-3">
				</div>
				<div class="col-md-6 animate-box" align="center">
					<p class="fs-1">마이페이지</p>
					<br>
					<div class="form-group" align="right">
						<input type="submit" value="회원수정" class="btn btn-warning" onclick="window.location='${path}/modifyUser.do'">
						<input type="reset" value="회원탈퇴" class="btn btn-warning" onclick="window.location='${path}/deleteUser.do'">
						<input type="button" value="로그아웃" class="btn btn-warning" onclick="window.location='${path}/logout.do'">
			
						<!-- admin 관리자인 경우 -> 관리자페이지 -->
						<c:if test="${dto.userType.equals('admin')}">
						<input class="btn btn-warning" type="button" value="관리자" onclick="window.location='${path}/adMain.ad'">
						</c:if>
					</div>
				</div>
			</div>	
			
				<div class="row">
					<div align="center">
						<br>
						<form name="mypageform">
							<!-- 중복확인 -->
							<table class="table table-bordered" style="width: 600px">
								<tr style="vertical-align: middle">
									<th> 아이디 <br><br></th>
									<td> ${sessionID} <br><br></td>
								</tr>
								<tr>
									<th> 이름 <br><br></th>
									<td> ${dto.userName} <br><br></td>
								</tr>
								<tr>
									<th> 성별 <br><br></th>
									<td> ${dto.userGender} <br><br></td>
								</tr>
								<tr>
									<th> 전화번호 <br><br></th>
									<td> ${dto.userHp} <br><br></td>
								</tr>
								<tr>
									<th> 주소 <br><br></th>
									<td> ${dto.userAddress} <br><br></td>
								</tr>
								<tr>
									<th> 생일 <br><br></th>
									<td> ${dto.userBirthday} <br><br></td>
								</tr>
								<tr>
									<th> 이메일 <br><br></th>
									<td> ${dto.userEmail} <br><br></td>
								</tr>
								<tr>
									<th> 가입일 <br><br></th>
									<td> ${dto.userRegDate} <br><br></td>
								</tr>
							</table>
						</form>	
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>











