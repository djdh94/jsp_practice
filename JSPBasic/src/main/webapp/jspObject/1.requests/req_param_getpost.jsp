<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // name "apple"에 딸려온 데이터 조회
    String id = request.getParameter("apple");
    // name "banana"에 딸려온 데이터를 변수 pw에 저장후 body에 출력하기
    String pw = request.getParameter("banana");
    
    String[] hobby = request.getParameterValues("hobby");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	전송받은 아이디:<%=id %><br/>
	전송받은 패스워드:<%=pw %><br/>
	전송받은 취미:<%=Arrays.toString(hobby) %>
	
</body>
</html>