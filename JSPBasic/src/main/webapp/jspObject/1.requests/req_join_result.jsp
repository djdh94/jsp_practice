<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    //post방식으로 전달된 한글이 꺠지는 경우
       request.setCharacterEncoding("utf-8");
    	String id = request.getParameter("id");
       String pw = request.getParameter("pw");
       String name = request.getParameter("name");
       String age = request.getParameter("age");
    	
       
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(id.equals("abcd")){ %>
	<h1>중복된 아이디로 가입불가</h1>
	<%}else{%>
	<h1><%=id %>(<%=name %>)님 가입을 축하드립니다.</h1>
	<%} %>
</body>
</html>