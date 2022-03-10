<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="http://localhost:8181/JSPBasic/boardUpdateForm" method="post">
<input type="hidden" name="board_num" value="${board.board_num}"/>
글제목:<input type="text" name="title" value="${board.title }"/>
글쓴이:<input type="text"  value="${board.writer }"readonly><br/>
작성날짜:<input type="text" value="${board.bdate }" readonly><br/>
최종수정날짜:<input type="text"  value="${board.mdate }" readonly><br/>
글내용:<textarea rows="30" name="content" cols="50">${board.content }</textarea><br/><br/>
<input type="submit" value="수정완료하기"/>
</form>
</body>
</html>