<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HealthJoinAction</title>


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
    				
    				<c:if test= "${insertCnt == 1}">
    					<script type="text/javascript">
    						setTimeout(function(){
    							alert("회원 등록신청이 완료 되었습니다");
    							window.location="${path}/main.do";
    						}, 1000);
    					</script>
    				</c:if>
    				
    				<c:if test="${insertCnt != 1}">
    					<script type="text/javascript">
	    					setTimeout(function() {
	                  			alert("회원 등록신청이 실패되었습니다");
	                  			window.location="${path}healthJoin.do";
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