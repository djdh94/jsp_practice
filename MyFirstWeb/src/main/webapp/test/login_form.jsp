<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = (String)session.getAttribute("session_id");
    if(id!=null){
    	response.sendRedirect("login_welcome.jsp");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login_check.jsp" method="post">
	<input type="text" name="id" placeholder="아이디"/><br/>
	<input type="password" name="pw" placeholder="패스워드"/><br/>
	<input type="submit" value="로그인"/>
	<input type="reset" value="초기화"/>
	
	</form>
	<a href="join_form.jsp">회원가입</a>
</body>
</html>