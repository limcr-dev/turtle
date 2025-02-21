<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adHealthDetailAction</title>

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
    			
    			<div id="section1">
    				<h1 align="center">헬스회원 수정 처리</h1>
    			</div>
    			
    			<div id="section2">
    				
    				<c:if test= "${updateCnt == 1}">
    					<script type="text/javascript">
    						setTimeout(function(){
    							alert("회원 수정 되었습니다");
    							window.location="${path}/adHealthList.ad?pageNum=${hiddenPageNum}";
    						}, 1000);
    					</script>
    				</c:if>
    				
    				<c:if test="${updateCnt != 1}">
    					<script type="text/javascript">
	    					setTimeout(function() {
	                  			alert("회원 수정 실패되었습니다");
	                  			window.location="${path}/adHealthDetailAction.ad?healthNo=${hiddenHealthNo}&pageNum=${hiddenPageNum}";
	                  		}, 1000);
    					</script>
    				</c:if>
    			</div>
    			
    		</div>
    	</div>
     <!-- footer 시작 -->
	<div class="footer_wrap">
    	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
     <!-- footer 끝 -->
      
   </div>
</body>
</html>