<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PT 예약 삭제</title>

<script>

</script>
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		<c:if test="${updateCnt == 1}">
			<script type="text/javascript">
			alert("PT상태가 완료로 변경되었습니다.");
			window.location="${path}/adRevPTList.ad?trainerId=${sessionID}";
		</script>
		</c:if>
		
		<c:if test="${updateCnt != 1}">
			<script type="text/javascript">
			alert("다시 시도해주세요.");
			window.location="${path}/adRevPTList.ad?trainerId=${sessionID}";
		</script>
		</c:if>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>