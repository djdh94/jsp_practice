<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("uid");
    String pw= request.getParameter("upw");
    String nick= request.getParameter("unick");
    
    if(id.equals("k") && pw.equals("1")){
    	session.setAttribute("session_id", id);
    	session.setAttribute("session_pw", pw);
    	session.setAttribute("session_nick",nick);
    	response.sendRedirect("session_welcome.jsp");
    	
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="session_login.jsp">돌아가기</a>
</body>
</html>