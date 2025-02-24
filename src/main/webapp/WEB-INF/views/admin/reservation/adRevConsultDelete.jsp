<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 예약 삭제</title>

<script>

</script>
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		<c:if test="${deleteCnt == 1}">
			<script type="text/javascript">
			alert("예약 취소가 완료되었습니다.");
			window.location="${path}/adRevConsultList.ad";
		</script>
		</c:if>
		
		<c:if test="${deleteCnt != 1}">
			<script type="text/javascript">
			alert("예약 취소에 실패하였습니다.");
			window.location="${path}/adRevConsultList.ad";
		</script>
		</c:if>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>