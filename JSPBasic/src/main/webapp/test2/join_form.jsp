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
	<input type="text" name="fid" placeholder="아이디" required/><br/>
	<input type="password" name="fpw" placeholder="패스워드" required/><br/>
	<input type="text" name="fname" placeholder="이름" required/><br/>
	<input type="email" name="femail" placeholder="이메일" required/><br/>
	<input type="submit" value="회원가입"/>
	<input type="reset" value="초기화"/>
	</form>
</body>
</html>