<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String id = (String)session.getAttribute("id_session");
    out.println(id);
    
    String name = (String)session.getAttribute("name_session");
    out.println(name);
    String java = (String)session.getAttribute("JSP");
    out.println(java);
    
   
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>