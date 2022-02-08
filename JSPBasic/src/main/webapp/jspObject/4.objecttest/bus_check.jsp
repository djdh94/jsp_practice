<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String age = request.getParameter("age");
    
    int numAge = Integer.parseInt(age);
    
    if(numAge<=19){
    	response.sendRedirect("bus_junior.jsp");
    }else if(numAge>=20 && numAge<=59){
    	response.sendRedirect("bus_adult.jsp");
    }else{
    	response.sendRedirect("bus_senior.jsp");
    }
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