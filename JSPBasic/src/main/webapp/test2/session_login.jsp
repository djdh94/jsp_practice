<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="session_login_check.jsp" method="post">
	<input type="text" name="uid" placeholder="아이디" required/><br/>
	<input type="password" name="upw" placeholder="패스워드" required/><br/>
	<input type="text" name="unick" placeholder="닉네임" /><br/>
	<input type="submit" value="전송" />&nbsp;&nbsp;
	<input type="reset" value="초기화"/>
	</form>
</body>
</html>