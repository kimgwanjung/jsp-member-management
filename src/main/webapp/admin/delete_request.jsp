<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.UsersDao" %>
<%@ page import="DTO.UsersDto" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 신청 현황</title>
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
    
    .form-container {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
    }
    
    .form-container div {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }
    
    .form-container label {
        font-weight: bold;
        width: 100px;
    }
    
    .form-container input[type="text"],
    .form-container input[type="password"] {
        flex-grow: 1;
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    
    .form-container input[type="submit"] {
        padding: 10px 20px;
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }
    
    hr {
        margin: 20px 0;
        border: none;
        border-top: 1px solid #ccc;
    }
</style>
</head>
<body>
<h1>회원탈퇴 신청 현황</h1>
<form method="post" action="adminpage.jsp" style="text-align: right;">
    <input type="submit" value="메인" style="padding: 10px 20px; background-color: #4CAF50; color: #fff; border: none; border-radius: 4px; cursor: pointer; font-size: 16px;">
</form>
<% 
    UsersDao usersDao = new UsersDao();
    ArrayList<UsersDto> dtos = usersDao.deletememberSelect();
    
    for (int i = 0; i < dtos.size(); i++) {
        UsersDto dto = dtos.get(i);
        
        int no = dto.getNo();
        String id = dto.getId();
        String pw = dto.getPw();
        String name = dto.getName();
        String phone = dto.getPhone();
        String email = dto.getEmail();
        String enabled = dto.getEnabled();
        String role = dto.getRole();
%>
<div class="form-container">
    <form action="../loginOk/approvedelete.jsp" method="post">
        <input type="hidden" name="userId" value="<%= no %>">
        <div>
            <label>ID:</label>
            <input type="text" value="<%= id %>" readonly>
        </div>
        <div>
            <label>Password:</label>
            <input type="password" value="<%= pw %>" readonly>
        </div>
        <div>
            <label>Name:</label>
            <input type="text" value="<%= name %>" readonly>
        </div>
        <div>
            <label>Phone:</label>
            <input type="text" value="<%= phone %>" readonly>
        </div>
        <div>
            <label>Email:</label>
            <input type="text" value="<%= email %>" readonly>
        </div>
        <div>
            <label>Enabled:</label>
            <input type="text" value="<%= enabled %>" readonly>
        </div>
        <div>
            <label>Role:</label>
            <input type="text" value="<%= role %>" readonly>
        </div>
        <div>
            <input type="submit" value="승인">
        </div>
    </form>
</div>
<hr>
<% 
    }
%>
</body>
</html>
