<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DAO.UsersDao" %>
<%@ page import="DTO.UsersDto" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원관리 페이지</title>
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

        .user-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .user-info {
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-gap: 10px;
            margin-bottom: 10px;
        }

        .user-info label {
            font-weight: bold;
        }

        .user-info span {
            font-weight: normal;
        }

        .manage-buttons {
            display: flex;
            justify-content: flex-end;
            margin-top: 10px;
        }

        .manage-buttons form {
            margin-left: 10px;
        }

        .manage-buttons input[type="submit"] {
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
<h1>회원관리 페이지</h1>
<form method="post" action="adminpage.jsp" style="text-align: right;">
    <input type="submit" value="메인" style="padding: 10px 20px; background-color: #4CAF50; color: #fff; border: none; border-radius: 4px; cursor: pointer; font-size: 16px;">
</form>

<br/>
<br/>

<%
    UsersDao usersDao = new UsersDao();
    ArrayList<UsersDto> dtos = usersDao.memberSelect();
    
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
<div class="user-container">
    <div class="user-info">
        <label>No:</label>
        <span><%= no %></span>
        
        <label>ID:</label>
        <span><%= id %></span>
        
        <label>Password:</label>
        <span><%= pw %></span>
        
        <label>Name:</label>
        <span><%= name %></span>
        
        <label>Phone:</label>
        <span><%= role.equals("일반사용자") ? "010-XXXX-XXXX" : phone %></span>
        
        <label>Email:</label>
        <span><%= email %></span>
        
        <label>Enabled:</label>
        <span><%= enabled %></span>
        
        <label>Role:</label>
        <span><%= role %></span>
    </div>
    <div class="manage-buttons">
        <form method="post" action="../loginOk/LoginController.jsp">
            <input type="hidden" name="command" value="change_enabled">
            <input type="hidden" name="no" value="<%=dto.getNo()%>">
            <input type="hidden" name="enabled" value="<%=dto.getEnabled() %>">
            <input type="submit" value="<%= dto.getEnabled().equals("정상") ? "일시정지로 변경" : "정상으로 변경" %>">
        </form>
        <form method="post" action="../loginOk/LoginController.jsp">
            <input type="hidden" name="command" value="change_role">
            <input type="hidden" name="no" value="<%=dto.getNo()%>">
            <input type="hidden" name="role" value="<%=dto.getRole()%>">
            <input type="submit" value="<%= dto.getRole().equals("관리자") ? "일반사용자로 변경" : "관리자로 변경" %>">
        </form>
        <form method="post" action="../loginOk/LoginController.jsp">
            <input type="hidden" name="command" value="goupdatepage2">
            <input type="hidden" name="no" value="<%=dto.getNo()%>">
            <input type="submit" value="조회 및 수정">
        </form>
    </div>
</div>
<hr>
<% 
    }
%>

<%
    UsersDao usersDao2 = new UsersDao();
    ArrayList<UsersDto> dtos2 = usersDao.joinmemberSelect();
    
    for (int i = 0; i < dtos2.size(); i++) {
        UsersDto dto = dtos2.get(i);
        
        int no = dto.getNo();
        String id = dto.getId();
        String pw = dto.getPw();
        String name = dto.getName();
        String phone = dto.getPhone();
        String email = dto.getEmail();
        String enabled = dto.getEnabled();
        String role = dto.getRole();
%>
<div class="user-container">
    <div class="user-info">
        <label>No:</label>
        <span><%= no %></span>
        
        <label>ID:</label>
        <span><%= id %></span>
        
        <label>Password:</label>
        <span><%= pw %></span>
        
        <label>Name:</label>
        <span><%= name %></span>
        
        <label>Phone:</label>
        <span><%= role.equals("일반사용자") ? "010-XXXX-XXXX" : phone %></span>
        
        <label>Email:</label>
        <span><%= email %></span>
        
        <label>Enabled:</label>
        <span><%= enabled %></span>
        
        <label>Role:</label>
        <span><%= role %></span>
        <h4>특이사항 : 회원승인 요청</h4>
    </div>
    <div class="manage-buttons">
        <form method="post" action="join_request.jsp">
            <input type="submit" value="회원가입 승인">
        </form>
    </div>
</div>
<hr>
<% 
    }
%>

<%
    UsersDao usersDao3 = new UsersDao();
    ArrayList<UsersDto> dtos3 = usersDao.deletememberSelect();
    
    for (int i = 0; i < dtos3.size(); i++) {
        UsersDto dto = dtos3.get(i);
        
        int no = dto.getNo();
        String id = dto.getId();
        String pw = dto.getPw();
        String name = dto.getName();
        String phone = dto.getPhone();
        String email = dto.getEmail();
        String enabled = dto.getEnabled();
        String role = dto.getRole();
%>
<div class="user-container">
    <div class="user-info">
        <label>No:</label>
        <span><%= no %></span>
        
        <label>ID:</label>
        <span><%= id %></span>
        
        <label>Password:</label>
        <span><%= pw %></span>
        
        <label>Name:</label>
        <span><%= name %></span>
        
        <label>Phone:</label>
        <span><%= role.equals("일반사용자") ? "010-XXXX-XXXX" : phone %></span>
        
        <label>Email:</label>
        <span><%= email %></span>
        
        <label>Enabled:</label>
        <span><%= enabled %></span>
        
        <label>Role:</label>
        <span><%= role %></span>
        
        <h4>특이사항 : 회원탈퇴 요청</h4>
    </div>
    <div class="manage-buttons">
        <form method="post" action="delete_request.jsp">
            <input type="submit" value="회원탈퇴 승인">
        </form>
    </div>
</div>
<hr>
<% 
    }
%>

</body>
</html>

