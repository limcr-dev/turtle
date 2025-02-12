<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>챗봇</title>
<style>
        /* 챗봇 버튼 스타일 */
         #chatbot-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 60px;
            height: 60px;
            background: url('webapp/resources/images/chatbot.png') no-repeat center;
            background-size: cover;
            border: none;
            cursor: pointer;
        }

        /* 챗봇 창 스타일 */
        #chatbot-container {
            display: none;
            position: fixed;
            bottom: 80px;
            right: 20px;
            width: 300px;
            height: 300px;
            background: white;
            border: 1px solid #ccc;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        #close-chatbot {
            text-align: right;
            padding: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <!-- 챗봇 버튼 -->
    <button id="chatbot-button"></button>

    <!-- 챗봇 창 -->
    <div id="chatbot-container">
        <div id="close-chatbot">❌</div>
        <iframe src="/chatbot" width="100%" height="100%" frameborder="0"></iframe>
    </div>

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

