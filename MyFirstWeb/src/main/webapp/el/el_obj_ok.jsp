<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String name=request.getParameter("name");
    String name2=request.getParameter("name2");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름:&nbsp;<%=name %><br/>
	별명:&nbsp;<%=name2 %><br/>
	<br/>
	이름:${param.name}<br/>
	별명:${param.name2}
</body>
</html>