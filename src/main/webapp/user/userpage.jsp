<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.UsersDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
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

.welcome-message {
  text-align: center;
  margin-bottom: 30px;
  font-size: 20px;
}

.menu-list {
  text-align: center;
}

.menu-list a {
  display: inline-block;
  margin: 5px;
  font-size: 16px;
  text-decoration: none;
  color: #333333;
  background-color: #ffffff;
  padding: 10px 20px;
  border-radius: 5px;
}

.menu-list a:hover {
  background-color: #f5f5f5;
}
</style>
</head>
<body>
<%
  UsersDto dto = (UsersDto) session.getAttribute("dto");

  if (dto == null) {
    pageContext.forward("browser.html");
  }
%>

<div class="container">
  <h1>메인화면</h1>
  <div class="welcome-message">
    <span><%= dto.getName() %>님 환영합니다. [등급: <%= dto.getRole() %>]</span>
  </div>
  <div class="menu-list">
    <a href="../loginOk/registform.jsp">회원가입</a>
    <a href="../loginOk/LoginController.jsp?command=userinfo&no=<%= dto.getNo() %>">정보 조회</a>
    <a href="deleteUser.jsp">회원 탈퇴</a>
    <a href="../loginOk/LoginController.jsp?command=logout">로그아웃</a>
  </div>
</div>
</body>
</html>
