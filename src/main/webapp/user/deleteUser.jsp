<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="DAO.UsersDao, DTO.UsersDto" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴 처리</title>
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
            text-align: center;
        }

        h1 {
            color: #333333;
            margin-bottom: 20px;
        }

        p {
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #333333;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
        }

        a:hover {
            background-color: #555555;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            // 세션에서 로그인한 사용자의 정보 가져오기
            UsersDto dto = (UsersDto) session.getAttribute("dto");

            // 사용자 정보가 없으면 다시 로그인 페이지로 이동
            if (dto == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // 회원 탈퇴를 처리하는 UsersDao 객체 생성
            UsersDao usersDao = new UsersDao();

            // 회원 탈퇴 처리
            boolean result = usersDao.deleteUser(dto.getNo());

            if (result) {
                // 회원 탈퇴 성공
                session.invalidate(); // 세션 무효화
                %>
                <h1>회원 탈퇴 완료</h1>
                <p>회원 탈퇴 신청이 성공적으로 완료되었습니다.</p>
                <p>관리자가 승인시 바로 회원탈퇴 됩니다.</p>
                <a href="../loginOk/Login.jsp">로그인 페이지로 이동</a>
                <%
            } else {
                // 회원 탈퇴 실패
                %>
                <h1>회원 탈퇴 실패</h1>
                <p>회원 탈퇴 중 오류가 발생했습니다. 다시 시도해주세요.</p>
                <a href="main.jsp">메인 페이지로 이동</a>
                <%
            }
        %>
    </div>
</body>
</html>
