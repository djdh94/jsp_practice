<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
글제목:<input type="text" value="${board.title }"readonly/>
글쓴이"<input type="text" value="${board.writer }"readonly/><br/>
글내용:<textarea rows="30" cols="50"readonly>${board.content }</textarea><br/>
작성날짜:${board.bdate }<br/>
최종수정날짜:${board.mdate }<br/>
조회수:${board.hit }<br/>

<a href="http://localhost:8181/JSPBasic/boardlist">목록으로</a><br/>
<form action="http://localhost:8181/JSPBasic/boarddelete" method="post">
<input type="hidden" name="board_num" value="${board.board_num }"/>
<input type="submit" value="삭제"/>
</form>
<form action="http://localhost:8181/JSPBasic/boardUpdatE" method="post">
<input type="hidden" name="board_num" value="${board.board_num }"/><br/>
<input type="submit" value="수정하기"/>
</form>
</body>
</html>