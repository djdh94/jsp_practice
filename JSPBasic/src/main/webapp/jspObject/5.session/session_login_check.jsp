<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	 request.setCharacterEncoding("utf-8");
	 String id=request.getParameter("id");
	 String pw=request.getParameter("pw");
	 String nickname=request.getParameter("nickname");

	 String loginCheck=(String)session.getAttribute("session_id");
	 if(loginCheck!=null){
		 response.sendRedirect("session_welcom.jsp");
	 }
	 
	 if(id.equals("kkk1234") && pw.equals("1111")){ 
	 	session.setAttribute("session_id", id);
    	session.setAttribute("session_pw", pw);
    	session.setAttribute("session_nick", nickname);
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
	 <a href="session_login.jsp">로그인 실패</a>
	 
</body>
</html>