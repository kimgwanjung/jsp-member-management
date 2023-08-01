<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="DAO.UsersDao" %>
<%@ page import="DTO.UsersDto" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    int userId = Integer.parseInt(request.getParameter("userId"));
    UsersDao usersDao = new UsersDao();
    usersDao.approveSignupRequest(userId);
    
    // 승인 작업 완료 후 리다이렉트 또는 다른 동작 수행
    response.sendRedirect("../admin/join_request.jsp");
%>
</body>
</html>