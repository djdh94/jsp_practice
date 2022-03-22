<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="http://localhost:8181/JSPBasic/insertBoarD" method="post">
<input type="text" name="title" placeholder="글제목"/><br/>
<input type="text" name="writer" placeholder="글쓰기"/><br/>
<textarea rows="30" cols="50" name="content"placeholder="글내용"></textarea><br/>
<input type="submit" value="글쓰기"/>
</form>
</body>
</html>