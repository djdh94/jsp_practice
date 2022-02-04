<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // radio는 여러 대상중 하나만 선택가능하기 때문에 하나만 넘겨오는것
    String cityName=request.getParameter("city");
    %>
   
    <%
    if(cityName.equals("jappan")){
    	response.sendRedirect("travel_jappan.jsp");
    }else if(cityName.equals("china")){
    	response.sendRedirect("travel_china.jsp");
    }else if(cityName.equals("korea")){
    	response.sendRedirect("travel_korea.jsp");
    }else if(cityName.equals("usa")){
    	response.sendRedirect("travel_usa.jsp");
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