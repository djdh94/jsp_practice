<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="http://localhost:8181/JSPBasic/boardUpdate" method="post">
<input type="hidden" name="board_num" value="${board.board_num }"/>
글제목:<input type="text" name="title"value="${board.title }"/>
글쓴이"<input type="text" value="${board.writer }"readonly/><br/>
글내용:<textarea rows="30" name="content"cols="50">${board.content }</textarea><br/>
작성날짜:${board.bdate }<br/>
최종수정날짜:${board.mdate }<br/>
조회수:${board.hit }<br/>
<input type="submit" value="수정완료"/>
</form>
</body>
</html>