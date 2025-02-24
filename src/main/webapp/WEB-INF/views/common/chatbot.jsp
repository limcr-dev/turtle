<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>챗봇</title>
       
</head>
<body>
<div class="kakaoChannel">	
	<img src="resources/images/turtle_tittle.png" style="width :180px; height : 120px">
	<b> 터틀짐</b>
	<br>
	
<!-- 카카오톡 챗봇 버튼 -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.4/kakao.min.js"
  integrity="sha384-DKYJZ8NLiK8MN4/C5P2dtSmLQ4KwPaoqAfyA/DfmEc1VDxu4yyC7wy6K1Hs90nka" crossorigin="anonymous"></script>
<script>
  Kakao.init('c089c8172def97eb00c07217cae17495'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<div id="chat-channel-button"></div>
<script>
  Kakao.Channel.createChatButton({
    container: '#chat-channel-button',
    channelPublicId: '_RxhAsn',
  });
</script>
</div>
	
<!-- 카카오톡 채널 추가 버튼 -->

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.4/kakao.min.js"
  integrity="sha384-DKYJZ8NLiK8MN4/C5P2dtSmLQ4KwPaoqAfyA/DfmEc1VDxu4yyC7wy6K1Hs90nka" crossorigin="anonymous"></script>
<script>
  Kakao.init('c089c8172def97eb00c07217cae17495'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<div id="add-channel-button"></div>

<script>
  Kakao.Channel.createAddChannelButton({
    container: '#add-channel-button',
    channelPublicId: '_RxhAsn',
  });
</script>

    <script>
        document.getElementById('chatbot-button').addEventListener('click', function() {
            document.getElementById('chatbot-container').style.display = 'block';
        });
        

        document.getElementById('close-chatbot').addEventListener('click', function() {
            document.getElementById('chatbot-container').style.display = 'none';
        });
        
        
    </script>

</body>
</html>

