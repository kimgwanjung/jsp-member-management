<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.UsersDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보관리</title>
<style>
body {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
  margin: 0;
  padding: 0;
}

.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 40px 20px;
}

h1 {
  color: #333333;
  text-align: center;
  margin-bottom: 30px;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 30px;
}

table th, table td {
  padding: 10px;
  text-align: left;
}

table th {
  background-color: #f5f5f5;
  font-weight: bold;
}

.table-button-row {
  text-align: center;
  margin-top: 30px;
}

.table-button-row input[type="button"] {
  display: inline-block;
  margin-right: 10px;
  padding: 10px 20px;
  background-color: #333333;
  color: #ffffff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.table-button-row input[type="button"]:last-child {
  margin-right: 0;
}

.table-button-row input[type="button"]:hover {
  background-color: #555555;
}
</style>
</head>
<body>
<%
  UsersDto dto = (UsersDto) request.getAttribute("dto");
%>

<div class="container">
  <h1>정보관리</h1>
  <table>
    <tr>
      <th>No</th>
      <td><%= dto.getNo() %></td>
    </tr>
    <tr>
      <th>ID</th>
      <td><%= dto.getId() %></td>
    </tr>
    <tr>
      <th>Password</th>
      <td><%= dto.getPw() %></td>
    </tr>
    <tr>
      <th>Name</th>
      <td><%= dto.getName() %></td>
    </tr>
    <tr>
      <th>Phone</th>
      <td><%= dto.getPhone() %></td>
    </tr>
    <tr>
      <th>Email</th>
      <td><%= dto.getEmail() %></td>
    </tr>
    <tr>
      <th>Enabled</th>
      <td><%= dto.getEnabled() %></td>
    </tr>
    <tr>
      <th>Role</th>
      <td><%= dto.getRole() %></td>
    </tr>
  </table>
  
  <div class="table-button-row">
    <input type="button" value="수정" onclick="location.href='LoginController.jsp?command=updatepage&no=<%= dto.getNo() %>'">
    <input type="button" value="로그인 화면" onclick="location.href='Login.jsp'">
  </div>
</div>
</body>
</html>
