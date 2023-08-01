<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }
    
    .button {
        display: inline-block;
        padding: 10px 20px;
        margin: 10px;
        background-color: #4CAF50;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
        border: none;
        cursor: pointer;
        font-size: 16px;
    }
    
    .button:hover {
        background-color: #45a049;
    }
    
    .button--secondary {
        background-color: #f44336;
    }
    
    .button--secondary:hover {
        background-color: #d32f2f;
    }
</style>
</head>
<body>
    <a href="loginOk/Login.jsp" class="button">로그인</a>
    <a href="registform.jsp" class="button button--secondary">회원가입</a>
</body>
</html>
