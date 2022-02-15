<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입 페이지</h1>
	<form action="join_check.jsp" method="post">
	<input type="text" name="fid" required placeholder="아이디"/><br/>
	<input type="password" name="fpw" required placeholder="비밀번호"/><br/>
	<input type ="text" name="fname" required placeholder="이름"/><br/>
	<input type = "email" name="femail" placeholder="이메일"/><br/>
	<input type="submit"/>
	<input type="reset"/>
	</form>
</body>
</html>