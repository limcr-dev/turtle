<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>

<!-- join.js -->
<script src="${path}/resources/js/join/join.js" defer></script>
</head>
<script type="text/javascript">
	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("jusoPopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		
	}
	
	function jusoCallBack(roadFullAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.querySelector('input[name="roadFullAddr"]').value = roadFullAddr;
		document.querySelector('input[name="userAddress"]').value = roadFullAddr;
	}
</script>
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
					<c:if test="${selectCnt ==1}">
					<div class="col-md-8 animate-box">
						<p class="fs-1" align="center">회원 정보 수정</p>
						<br>
						<form name="modifyform" action="modifyUserAction.do" method="post"
							onsubmit="return modifyCheck()">
						
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									아이디
								</div>
								<div class="col-md-10">
									${dto.userId}
									<input type="hidden" id="hiddenUserId" name="hiddenUserId" value="${dto.userId}">
								</div>
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									이메일
								</div>
								<div class="col-md-10">
									${dto.getUserEmail()}
								</div>
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									비밀번호
								</div>
								<div class="col-md-10">
									<input type="password" id="userPw" name="userPw" class="form-control form-control-lg" placeholder="비밀번호를 입력하세요" required>
								</div>
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									비밀번호<p>(확인)
								</div>
								<div class="col-md-10">
									<input type="password" id="r_userPw" name="r_userPw" class="form-control form-control-lg" placeholder="비밀번호 확인" required>
								</div>
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									이름
								</div>
								<div class="col-md-10">
									<input type="text" id="userName" name="userName" class="form-control  form-control-lg" value="${dto.getUserName()}" placeholder="이름을 입력하세요" required>
								</div>
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									전화번호
								</div>
								<c:if test="${dto.getUserHp() != null}">
									<c:set var="hpArr" value="${fn:split(dto.getUserHp(),'-')}" />
										<div class="col-md-2">
											<input type="text" id="userHp1" name="userHp1" class="form-control form-control-lg" value="${hpArr[0]}">
										</div>
										
										<div class="col-md-1" align="center">-</div>
										
										<div class="col-md-3">
											<input type="text" id="userHp2" name="userHp2" class="form-control form-control-lg" value="${hpArr[1]}">
										</div>
										
										<div class="col-md-1" align="center">-</div>
										
										<div class="col-md-3">		
											<input type="text" id="userHp3" name="userHp3" class="form-control form-control-lg" value="${hpArr[2]}">
										</div>
									
								</c:if>
								<c:if test="${dto.getUserHp() == null}">
									<div class="col-md-2">
										<input type="text" id="userHp1" name="userHp1" class="form-control form-control-lg">
									</div>
									
									<div class="col-md-1" align="center">-</div>
									
									<div class="col-md-3">
										<input type="text" id="userHp2" name="userHp2" class="form-control form-control-lg">
									</div>
									
									<div class="col-md-1" align="center">-</div>
									
									<div class="col-md-3">		
										<input type="text" id="userHp3" name="userHp3" class="form-control form-control-lg">
									</div>
								</c:if>
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									주소
								</div>
								<div class="col-md-8">
									<input type="text" id="userAddress" name="userAddress" class="form-control  form-control-lg" value="${dto.getUserAddress()}" placeholder="주소를 입력하세요" required>
								</div>
								
								<div class="col-md-2">
									<input type="button" class="btn btn-secondary" name="ad_find" value="주소찾기" onclick="goPopup()">
								</div>
							</div>
							<br>
							
							<div class="row form-group">
								<div class="col-md-2">
								</div>
								<div class="col-md-10">
									<input type="text" id="roadFullAddr" name="roadFullAddr" class="form-control form-control-lg" name="roadFullAddr" >
								</div>
							</div>
							<p>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									생일
								</div>
								<div class="col-md-10">
									<input type="date" id="userBirthday" name="userBirthday" class="form-control form-control-lg" value="${dto.userBirthday}" placeholder="생년월일을 입력하세요" required>
								</div>
							</div>
							<br>
							
							<div class="form-group" align="right">
								<input type="submit" value="회원수정" class="btn btn-dark">
								<input type="reset" value="초기화" class="btn btn-dark">
								<input type="button" value="수정취소" class="btn btn-dark" onclick="window.location='mypage.do'">
							</div>
						</form>	
					</div>	
					</c:if>
				</div>
			</div>
			<div class="col-md-2">
			</div>	
		</div>
		
		<c:if test="${selectCnt != 1}">
			<script type="text/javascript">
				alert("인증 실패");
				window.location="modifyUser.do"
			</script>
		</c:if>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>
