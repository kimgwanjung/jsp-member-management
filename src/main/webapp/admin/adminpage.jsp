<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DTO.UsersDto" %>
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
    
    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 30px;
    }
    
    div.container {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    
    span {
        display: block;
        text-align: center;
        font-weight: bold;
        margin-bottom: 20px;
        color: #555;
    }
    
    div.link-list {
        text-align: center;
        margin-bottom: 20px;
    }
    
    div.link-list a {
        display: block;
        margin-bottom: 10px;
        color: #333;
        text-decoration: none;
        background-color: #f9f9f9;
        padding: 10px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }
    
    div.link-list a:hover {
        background-color: #ebebeb;
    }
    
    div.logout {
        text-align: center;
        margin-top: 20px;
    }
    
    div.logout a {
        color: #333;
        text-decoration: none;
    }
</style>
</head>
<body>
<%
    UsersDto dto = (UsersDto)session.getAttribute("dto");

    if(dto == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>
    <h1>메인화면</h1>
    <div class="container">
        <span><%= dto.getName() %>님 환영합니다. [등급: <%=dto.getRole() %>]</span>
        <div class="link-list">
            <a href="UserManager.jsp">회원관리</a>
            <a href="join_request.jsp">회원가입(승인)</a>
            <a href="delete_request.jsp">회원탈퇴(승인)</a>
        </div>
        <div class="logout">
            <a href="../loginOk/LoginController.jsp?command=logout">로그아웃</a>
        </div>
    </div>
</body>
</html>