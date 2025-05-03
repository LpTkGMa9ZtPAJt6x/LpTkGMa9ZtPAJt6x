<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ChatGPT助手</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(45deg, #f2f2f2, #e6e6e6);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 500px;
        }
        h1 {
            color: #333;
            font-size: 2em;
            margin-bottom: 10px;
        }
        .chatbox {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 10px;
            height: 300px;
            overflow-y: scroll;
            margin-bottom: 20px;
            background-color: #f9f9f9;
        }
        .input-container {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }
        input[type="text"] {
            width: 70%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-right: 10px;
        }
        button {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>ChatGPT助手</h1>
    <div class="chatbox" id="chatbox">
        <p>欢迎来到ChatGPT助手！你可以开始提问。</p>
    </div>
    <div class="input-container">
        <input type="text" id="userInput" placeholder="请输入你的问题...">
        <button onclick="sendMessage()">发送</button>
    </div>
</div>

<script>
    function sendMessage() {
        var userInput = document.getElementById('userInput').value;
        if (userInput.trim() === "") {
            alert("请输入问题");
            return;
        }
        
        // 添加用户消息到聊天框
        var chatbox = document.getElementById('chatbox');
        chatbox.innerHTML += "<p><strong>你:</strong> " + userInput + "</p>";

        // 模拟AI的回应（这里只是简单模拟，你可以替换为真实的AI处理）
        setTimeout(function() {
            chatbox.innerHTML += "<p><strong>ChatGPT:</strong> 这是AI的回答: " + "我暂时无法理解该问题，但我会不断学习!" + "</p>";
            chatbox.scrollTop = chatbox.scrollHeight;  // 滚动到底部
        }, 1000);
        
        // 清空输入框
        document.getElementById('userInput').value = '';
    }
</script>

</body>
</html>
