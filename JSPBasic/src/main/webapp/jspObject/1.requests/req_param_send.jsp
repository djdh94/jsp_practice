	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- form의 action의 바로 목적지를 적는 부분임.
웹 개발에서는 받을 페이지 화면의 주소를 적어줌 --%>
	<form action="req_param_getpost.jsp" method="get">
	<input type="text" name="apple" placeholder="apple"/><br/>
	<input type="password" name="banana" placeholder="banana"/><br/>
	
	취미:
	<input type="checkbox" name="hobby" value="요리">요리&nbsp;
	<input type="checkbox" name="hobby" value="축구">축구&nbsp;
	<input type="checkbox" name="hobby" value="농구">농구&nbsp;
	<input type="checkbox" name="hobby" value="볼링">볼링&nbsp;
	<input type="checkbox" name="hobby" value="당구">당구&nbsp;
	<input type="reset" />
	<input type="submit"/>
	
	
	</form>
</body>
</html>