<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬스 회원 삭제</title>

<!-- join.js -->
<script src="${path}/resources/js/health/insert.js" defer></script>
</head>
<body>
<div class="wrap">
     <!-- header 시작 -->
	<div class="header_wrap">
    	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	</div>
    <!-- header 끝 --> 
    	<div id="cotainer">
    		<div id= "contents">
    			<div id="section2">
    				
    				<c:if test= "${deleteCnt == 1}">
    					<script type="text/javascript">
    						setTimeout(function(){
    							alert("헬스 회원을 삭제하였습니다.");
    							window.location="${path}/adHealthList.ad";
    						}, 1000);
    					</script>
    				</c:if>
    				
    				<c:if test="${deleteCnt != 1}">
    					<script type="text/javascript">
	    					setTimeout(function() {
	                  			alert("헬스 회원 삭제를 실패하였습니다.");
	                  			window.location="${path}/adHealthList.ad";
	                  		}, 1000);
    					</script>
    				</c:if>
    			</div>
    			
    		</div>
    	</div>
   </div>
<!-- footer 시작 -->
<div class="footer_wrap">
   	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
<!-- footer 끝 -->
</body>
</html>