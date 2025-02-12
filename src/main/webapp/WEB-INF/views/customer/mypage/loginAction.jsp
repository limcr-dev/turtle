<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
<!-- join.js -->
<script src="${path}/resources/js/join/join.js" defer></script>
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		<br>
			<!-- 세션이 없는 경우 : 로그인 실패 -->
			<c:if test="${sessionScope.sessionID == null}">
				<script type="text/javascript">
					alert("아이디와 비밀번호가 일치 하지 않습니다.");
					window.location="${path}/login.do"
				</script>
			</c:if>
			
			<!-- 세션이 있는 경우 : 로그인 완료 -->
			<c:if test="${sessionScope.sessionID != null}">
				<script type="text/javascript">
					window.location="${path}/main.do"
				</script>
			</c:if>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>