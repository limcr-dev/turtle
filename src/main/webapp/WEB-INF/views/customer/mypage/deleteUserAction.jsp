<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴인증결과</title>
<!-- join.js -->
<script src="${path}/resources/js/join/join.js" defer></script>

</head>
<body>
	<div class="wrap">
	<!-- header 시작 -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<!-- header 끝 -->

	<c:if test="${deleteCnt == 1}">
		<script type="text/javascript">
			alert("회원탈퇴 성공!!");
			window.location="${path}/main.do";
		</script>
	</c:if>
	
	<c:if test="${deleteCnt != 1}">
		<script type="text/javascript">
			alert("회원인증 실패로 탈퇴 실패!!");
			window.location="${path}/deleteUser.do";
		</script>
	</c:if>
	
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>