<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.UsersDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
  $("#updateform").submit(function() {
    var count = 0;
    $(".updatedata").each(function() {
      if ($(this).val().trim() == "") {
        alert($(this).prev("label").text() + "을(를) 입력하세요.");
        $(this).focus();
        count++;
        return false;
      }
    });
    if (count > 0) {
      return false;
    }
  });
});
</script>
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

form div {
  margin-bottom: 20px;
}

label {
  font-weight: bold;
}

input[type="text"],
input[type="password"] {
  padding: 5px;
  width: 100%;
}

input[type="submit"] {
  display: inline-block;
  padding: 10px 20px;
  background-color: #333333;
  color: #ffffff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

input[type="submit"]:hover {
  background-color: #555555;
}
</style>
</head>
<body>
<%
  UsersDto dto = (UsersDto) request.getAttribute("dto");
%>

<div class="container">
  <h1>나의 정보 수정</h1>

  <form method="post" action="LoginController.jsp" id="updateform">
    <input type="hidden" name="command" value="updateuser">
    <input type="hidden" name="no" value="<%= dto.getNo() %>">
    <div>
      <label for="id">ID:</label>
      <span><%= dto.getId() %></span>
    </div>
    <div>
      <label for="name">이름:</label>
      <span><%= dto.getName() %></span>
    </div>
    <div>
      <label for="pw">비밀번호:</label>
      <input type="password" class="updatedata" name="pw" value="<%= dto.getPw() %>">
    </div>
    <div>
      <label for="email">이메일:</label>
      <input type="text" class="updatedata" name="email" value="<%= dto.getEmail() %>">
    </div>
    <div>
      <label for="phone">핸드폰:</label>
      <input type="text" class="updatedata" name="phone" value="<%= dto.getPhone() %>">
    </div>
    <div>
      <input type="submit" value="수정하기">
    </div>
  </form>
</div>
</body>
</html>
