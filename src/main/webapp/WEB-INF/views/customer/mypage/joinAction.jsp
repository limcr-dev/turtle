<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입결과</title>

<!-- join.js -->
<script src="${path}/resources/js/customer/join.js" defer></script>

</head>
<body>
	<div class="wrap">
	<!-- header 시작 -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<!-- header 끝 -->

	<c:if test="${insertCnt == 1}">
		<script type="text/javascript">
			alert("회원가입 성공!!");
			window.location="${path}/login.do";
		</script>
	</c:if>
	
	<c:if test="${insertCnt != 1}">
		<script type="text/javascript">
			alert("회원가입 실패!!");
			window.location="${path}/join.do";
		</script>
	</c:if>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>