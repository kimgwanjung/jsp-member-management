<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }
    
    h1 {
        text-align: center;
        color: #333;
    }
    
    form {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    
    label {
        display: block;
        font-weight: bold;
        margin-bottom: 10px;
    }
    
    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        margin-bottom: 20px;
    }
    
    input[type="submit"] {
        padding: 10px 20px;
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }
    
    input[type="submit"]:hover {
        background-color: #45a049;
    }
    
    .register-btn {
        display: block;
        text-align: center;
        margin-top: 20px;
        color: #333;
        text-decoration: underline;
        cursor: pointer;
    }
</style>
</head>
<body>
    <h1>로그인</h1>
    <form action="LoginController.jsp" method="POST">
        <label for="id">아이디:</label>
        <input type="text" id="id" name="id" required><br><br>
        <label for="pw">비밀번호:</label>
        <input type="password" id="pw" name="pw" required><br><br>
        <input type="submit" name="command" value="login">
    </form>
    <a href="registform.jsp" class="register-btn">회원가입</a>
</body>
</html>
