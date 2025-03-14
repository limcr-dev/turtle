<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소입력</title>
<% 
	request.setCharacterEncoding("UTF-8"); 
	String inputYn = request.getParameter("inputYn"); 
	String roadFullAddr = request.getParameter("roadFullAddr"); 
%>
</head>
<script>

	function init(){
		var url = location.href;
		var confmKey = "devU01TX0FVVEgyMDI1MDEwODE3MDEyMjExNTM5MTY=";
		var resultType = "4"; // 도로명주소 검색결과 화면 출력내용, 1 : 도로명, 2 : 도로명+지번+상세보기(관련지번, 관할주민센터), 3 : 도로명+상세보기(상세건물명), 4 : 도로명+지번+상세보기(관련지번, 관할주민센터, 상세건물명)
		var inputYn= "<%=inputYn%>";
		if(inputYn != "Y"){
			document.form.confmKey.value = confmKey;
			document.form.returnUrl.value = url;
			document.form.resultType.value = resultType;
			document.form.action="https://business.juso.go.kr/addrlink/addrLinkUrl.do"; //인터넷망
			//document.form.action="https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do"; //모바일 웹인 경우, 인터넷망
			document.form.submit();
			
		}else{
			opener.jusoCallBack("<%=roadFullAddr%>");
			window.close();
		}
	}
	
	function sendAddress() {
	    var roadFullAddr = document.getElementById('roadFullAddr').value;
	   
	    // 부모 창의 콜백 함수 호출
	    window.opener.jusoCallBack(roadFullAddr);
	    
	    // 팝업 닫기
	    window.close();
	}
</script>
<body onload="init();">
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<input type="hidden" id="resultType" name="resultType" value=""/>
	</form>
</body>
</html>