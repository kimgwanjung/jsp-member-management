<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="DAO.UsersDao" %>
    <%@ page import ="DTO.UsersDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String command = request.getParameter("command");
	
	UsersDao dao = new UsersDao();
	
	if(command.equals("login")){
	    String id = request.getParameter("id");
	    String pw = request.getParameter("pw");
	    
	    UsersDto dto = dao.login(id, pw); //수정
	    
	    if(dto.getId() != null){
	        session.setAttribute("dto", dto);
	        session.setMaxInactiveInterval(60*60);
	        
	        
	        // 로그인시
	        // 관리자계정으로 로그인 한 경우 -> 관리자로
	        if(dto.getRole().equals("관리자") && dto.getEnabled().equals("정상")){
	            response.sendRedirect("../admin/adminpage.jsp");
	            
	        }else if(dto.getRole().equals("일반사용자") && dto.getEnabled().equals("정상")){
	            response.sendRedirect("../user/userpage.jsp");
	        }else{
	            %>
	            <script type = "text/javascript">
	            	alert("로그인 실패");
	            	location.href="Login.jsp";
	            </script>
	            <%
	        }
	    }else{
	        %>
            <script type = "text/javascript">
            	alert("해당 아이디는 존재하지 않습니다.");
            	location.href="Login.jsp";
            </script>
            <%
	    }
	}else if(command.equals("logout")){
	    session.invalidate();
	    response.sendRedirect("Login.jsp");
	}
	// join
	else if(command.equals("insertuser")){
	    String id = request.getParameter("id");
	    String pw = request.getParameter("pw");
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String phone = request.getParameter("phone");
	    
	    UsersDto dto = new UsersDto();
	    dto.setId(id);
	    dto.setPw(pw);
	    dto.setName(name);
	    dto.setEmail(email);
	    dto.setPhone(phone);
	    
	    int res = dao.insertUser(dto);
	    
	    if(res > 0){
	        %>
	        
	        <script type = "text/javascript">
	        	alert("회원가입 신청이 완료되었어요. 관리자가 승인할 때 까지 기다려주기!");
	        	location.href="Login.jsp";
	        </script>
	        <%
	    } else{
			%>
	        
	        <script type = "text/javascript">
	        	alert("회원가입 형식이 맞지 않아요!");
	        	location.href="registform.jsp";
	        </script>
	        <%
	    }
	    
	}else if(command.equals("idchk")){
	    String id = request.getParameter("id");
	    String res = dao.idChk(id);
	
	    boolean idnotused = true;
	    
	    if(res != null){
	        idnotused = false;
	    }
	    
	    response.sendRedirect("idchk.jsp?idnotused=" + idnotused);
	}else if(command.equals("userinfo")){
	    int no = Integer.parseInt(request.getParameter("no"));
	    UsersDto dto = dao.selectUser(no);
	
		request.setAttribute("dto", dto);
		pageContext.forward("../user/userinfo.jsp");
	}else if(command.equals("userinfo2")){
	    int no = Integer.parseInt(request.getParameter("no"));
	    UsersDto dto = dao.selectUser(no);
	
		request.setAttribute("dto", dto);
		pageContext.forward("../user/userinfoadmin.jsp");
	}else if(command.equals("updatepage")){
	    int no = Integer.parseInt(request.getParameter("no"));
	    UsersDto dto = dao.selectUser(no);
	    
	    request.setAttribute("dto", dto);
	    
	   
	    pageContext.forward("updateuser.jsp");

	    
	    
	} else if(command.equals("updatepage2")){
	    int no = Integer.parseInt(request.getParameter("no"));
	    UsersDto dto = dao.selectUser(no);
	    
	    request.setAttribute("dto", dto);
	    
	   
	    pageContext.forward("updateuser2.jsp");

	    
	    
	}else if(command.equals("updateuser")){
	    String noParam = request.getParameter("no");
	    int no = 0; // Default value or appropriate value for your case

	    if (noParam != null && noParam.matches("\\d+")) {
	        no = Integer.parseInt(noParam);
	    } else {
	        // Handle the case when "no" parameter is missing or not a valid integer
	        // For example:
	        out.println("Invalid 'no' parameter");
	        return; // Exit from the JSP page
	    }

	    // Rest of your code
	    String pw = request.getParameter("pw");
	    String email = request.getParameter("email");
	    String phone = request.getParameter("phone");
	    //String enabled = request.getParameter("enabled");
	    //String role = request.getParameter("role");

	    UsersDto dto = new UsersDto();
	    dto.setPw(pw);
	    dto.setEmail(email);
	    dto.setPhone(phone);
	    dto.setNo(no);
	    //dto.setEnabled(enabled);
	    //dto.setRole(role);
	    boolean res = dao.updateUser(dto);
	    if(res){
	        %>
	        <script type="text/javascript">
	        	alert("수정성공");
	        	location.href="LoginController.jsp?command=userinfo&no=<%=no%>";
	        	
	        </script>
	        <% 
	    }else{
	        %>
	        <script type="text/javascript">
	        	alert("수정 페이지로 갈까요?");
	        	location.href="LoginController.jsp?command=userinfo&no=<%=no%>";
	        	
	        </script>
	        <% 
	    }
	}else if(command.equals("updateuser2")){
	    String noParam = request.getParameter("no");
	    int no = 0; // Default value or appropriate value for your case

	    if (noParam != null && noParam.matches("\\d+")) {
	        no = Integer.parseInt(noParam);
	    } else {
	        // Handle the case when "no" parameter is missing or not a valid integer
	        // For example:
	        out.println("Invalid 'no' parameter");
	        return; // Exit from the JSP page
	    }

	    // Rest of your code
	    String pw = request.getParameter("pw");
	    String email = request.getParameter("email");
	   
	    //String enabled = request.getParameter("enabled");
	    //String role = request.getParameter("role");

	    UsersDto dto = new UsersDto();
	    dto.setPw(pw);
	    dto.setEmail(email);
	    dto.setNo(no);
	    //dto.setEnabled(enabled);
	    //dto.setRole(role);
	    boolean res = dao.updateUser2(dto);
	    if(res){
	        %>
	        <script type="text/javascript">
	        	alert("수정성공");
	        	location.href="LoginController.jsp?command=userinfo&no=<%=no%>";
	        	
	        </script>
	        <% 
	    }else{
	        %>
	        <script type="text/javascript">
	        	alert("수정 페이지로 갈까요?");
	        	location.href="LoginController.jsp?command=userinfo&no=<%=no%>";
	        	
	        </script>
	        <% 
	    }
	}else if(command.equals("goupdatepage")){
	    String noParam = request.getParameter("no");
	    int no = 0; // Default value or appropriate value for your case

	    if (noParam != null && noParam.matches("\\d+")) {
	        no = Integer.parseInt(noParam);
	    } else {
	        // Handle the case when "no" parameter is missing or not a valid integer
	        // For example:
	        out.println("Invalid 'no' parameter");
	        return; // Exit from the JSP page
	    }

	    // Rest of your code
	    String pw = request.getParameter("pw");
	    String email = request.getParameter("email");
	    String phone = request.getParameter("phone");
	    //String enabled = request.getParameter("enabled");
	    //String role = request.getParameter("role");

	    UsersDto dto = new UsersDto();
	    dto.setPw(pw);
	    dto.setEmail(email);
	    dto.setPhone(phone);
	    dto.setNo(no);
	    //dto.setEnabled(enabled);
	    //dto.setRole(role);
	    %>
        <script type="text/javascript">
        	location.href="LoginController.jsp?command=userinfo&no=<%=no%>";
        	
        </script>
        <% 
	   
	}else if(command.equals("change_enabled")){
	    String noParam = request.getParameter("no");
	    
	    int no = 0; // Default value or appropriate value for your case

	    if (noParam != null && noParam.matches("\\d+")) {
	        no = Integer.parseInt(noParam);
	    } else {
	        // Handle the case when "no" parameter is missing or not a valid integer
	        // For example:
	        out.println("Invalid 'no' parameter");
	        return; // Exit from the JSP page
	    }
	    
	    String enabled = request.getParameter("enabled");

	    if (enabled != null) {
		    UsersDto dto = new UsersDto();
		    dto.setNo(no);
		    dto.setEnabled(enabled);
	
		    UsersDao usersDao = new UsersDao();
		    boolean result = usersDao.changeEnabled(dto);
		    
		    if (result) {
		        // Enabled change successful
		        System.out.println("성공적");
		        %>
		       		<script type="text/javascript">
		       			location.href="../admin/test.jsp"
		       		</script>
		        <%
		    } else {
		        // Enabled change failed
		        out.println("Failed to change enabled");
		    }
	    }else {
	        out.println("Invalid 'enabled' parameter");
	    }
	    
	    
	}else if(command.equals("change_role")){
		String noParam = request.getParameter("no");
	    
	    int no = 0; // Default value or appropriate value for your case

	    if (noParam != null && noParam.matches("\\d+")) {
	        no = Integer.parseInt(noParam);
	    } else {
	        // Handle the case when "no" parameter is missing or not a valid integer
	        // For example:
	        out.println("Invalid 'no' parameter");
	        return; // Exit from the JSP page
	    }
	    
	    String role = request.getParameter("role");
	    if (role != null) {
		    UsersDto dto = new UsersDto();
		    dto.setNo(no);
		    dto.setRole(role);
	
		    UsersDao usersDao = new UsersDao();
		    boolean result = usersDao.changeRole(dto);
		    
		    if (result) {
		        // Enabled change successful
		        System.out.println("성공적");
		        %>
		       		<script type="text/javascript">
		       			location.href="../admin/test.jsp"
		       		</script>
		        <%
		    } else {
		        // Enabled change failed
		        out.println("Failed to change enabled");
		    }
	    }else {
	        out.println("Invalid 'enabled' parameter");
	    }
	}else if(command.equals("goupdatepage2")){
	    String noParam = request.getParameter("no");
	    int no = 0; // Default value or appropriate value for your case

	    if (noParam != null && noParam.matches("\\d+")) {
	        no = Integer.parseInt(noParam);
	    } else {
	        // Handle the case when "no" parameter is missing or not a valid integer
	        // For example:
	        out.println("Invalid 'no' parameter");
	        return; // Exit from the JSP page
	    }

	    // Rest of your code
	    String pw = request.getParameter("pw");
	    String email = request.getParameter("email");
	    String phone = request.getParameter("phone");
	   

	    UsersDto dto = new UsersDto();
	    dto.setPw(pw);
	    dto.setEmail(email);
	    dto.setPhone(phone);
	    dto.setNo(no);
	    
	    %>
        <script type="text/javascript">
        	location.href="LoginController.jsp?command=userinfo2&no=<%=no%>";
        	
        </script>
        <% 
	   
	}

	
	
%>
</body>
</html>