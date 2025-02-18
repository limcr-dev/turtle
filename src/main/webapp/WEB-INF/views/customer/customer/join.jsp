<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

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
					<div class="col-md-8 animate-box">
						<p class="fs-1">회원가입</p>
						<br>
						<form name="inputform" action="joinAction.do" method="post"
							onsubmit="return signInCheck()">
							
							<!-- 중복확인 -->
							<input type="hidden" name="hiddenUserid" value="0">
							<input type="hidden" name="hiddenUserEmail" value="0">
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									아이디
								</div>
								<div class="col-md-8">
									<input type="text" name="userId" id="userId" class="form-control form-control-lg" placeholder="아이디를 입력하세요" required autofocus>
								</div>
								<div class="col-md-2">
									<input type="button" class="btn btn-secondary" name="dubChk" value="중복확인" onclick="confirmId()">
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
									<input type="text" id="userName" name="userName" class="form-control  form-control-lg" placeholder="이름을 입력하세요" required>
								</div>
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									전화번호
								</div>
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
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									주소
								</div>
								<div class="col-md-8">
									<input type="text" id="userAddress" name="userAddress" class="form-control  form-control-lg" placeholder="주소를 입력하세요" required>
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
									<input type="date" id="userBirthday" name="userBirthday" class="form-control form-control-lg" placeholder="생년월일을 입력하세요" required>
								</div>
							</div>
							<br>
							
							<div class="row g-3 align-items-center">
								<div class="col-md-2">
									이메일
								</div>
								<div class="col-md-3">
								
								  <label class="visually-hidden" for="specificSizeInputName">Name</label>
								  <input type="text" class="form-control form-control-lg" id="userEmail1" name="userEmail1" placeholder="이메일" required>
								</div>
								<div class="col-md-4">
								  <label class="visually-hidden" for="specificSizeInputGroupUsername">Username</label>
								  <div class="input-group">
								    <div class="input-group-text">@</div>
								    <input type="text" class="form-control form-control-lg" id="userEmail2" name="userEmail2" placeholder="이메일 주소" required>
								  </div>
								</div>
								<div class="col-md-3">
								  <label class="visually-hidden" for="specificSizeSelect">Preference</label>
								  <select class="form-select  form-select-lg" id="userEmail3" name="userEmail3" onchange="selectEmailChk()">
								    <option selected>선택</option>
								    <option value="naver.com">네이버</option>
								    <option value="google.com">구글</option>
								    <option value="daum.net">다음</option>
								    <option value="nate.com">네이트</option>
								  </select>
								</div>
								<div class="col-md-2">
									<input type="button" class="btn btn-secondary" name="emailChk" value="이메일 중복 확인" onclick="confirmEmail()">
								</div>
								
							</div>
							<br>
	
							<div class="row form-group">
								<!-- <label for="message">Message</label> -->
								<textarea name="message" id="message" cols="30" rows="10" class="form-control form-control-lg" placeholder="체형에 대한 고민을 작성해주세요"></textarea>
							</div>
							<br>
							
							<div class="form-group" align="right">
								<input type="submit" value="회원가입" class="btn btn-dark">
								<input type="reset" value="초기화" class="btn btn-dark">
								<input type="button" value="가입취소" class="btn btn-dark" onclick="window.location='${path}/main.do'">
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