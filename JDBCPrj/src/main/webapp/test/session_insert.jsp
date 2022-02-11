<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   	session.setAttribute("id_session", "abc");
    session.setAttribute("name_session", "dba");
    session.setAttribute("JSP", "SPRING");
    
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="session_check.jsp">세션확인</a>
</body>
</html>