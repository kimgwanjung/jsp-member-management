<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
    input[type="password"],
    input[type="email"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        margin-bottom: 20px;
    }
    
    input[type="button"],
    input[type="submit"] {
        padding: 10px 20px;
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }
    
    input[type="button"]:hover,
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
<script type="text/javascript">
    function idChk(){
        var doc = document.getElementsByName("id")[0];
        if(doc.value.trim() == "" || doc.value == null){
            alert("아이디를 입력하세요.");
        } else {
            var target = "LoginController.jsp?command=idchk&id=" + doc.value.trim();
            window.open(target, "", "width=500, height=500");
        }
    }
    function idChkOk(){
        var chkid = document.getElementsByName("id")[0].title;
        if(chkid == "n"){
            alert("아이디 중복체크를 해주세요.");
            document.getElementsByName("id")[0].focus();
        }
    }
</script>
</head>
<body>
    <h1>회원가입</h1>
    <form method="post" action="LoginController.jsp">
        <input type="hidden" name="command" value="insertuser">
        <div>
            <label for="id">ID:</label>
            <input type="text" id="id" name="id" required="required" title="n">
            <input type="button" value="중복체크" onclick="idChk();">
        </div>
        <br>
        <div>
            <label for="pw">비밀번호(4자리이상):</label>
            <input type="password" id="pw" name="pw" required="required" onclick="idChkOk();">
        </div>
        <div>
            <label for="name">이름:</label>
            <input type="text" id="name" name="name" required="required">
        </div>
        <div>
            <label for="email">이메일:</label>
            <input type="email" id="email" name="email" placeholder="@user.com" required>
        </div>
        <div>
            <label for="phone">전화번호:(010-XXXX-XXXX)</label>
            <input type="text" id="phone" name="phone" required>
        </div>
        <div>
            <input type="submit" value="가입하기">
        </div>
    </form>
    <a href="Login.jsp" class="register-btn">로그인</a>
    <br>
</body>
</html>
