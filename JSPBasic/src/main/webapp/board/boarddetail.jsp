<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
글제목:<input type="text" value="${board.title }" readonly/>
글쓴이:<input type="text" value="${board.writer }"readonly><br/>
글내용:<textarea rows="30" cols="50"readonly>${board.content }</textarea><br/><br/>
<a href="http://localhost:8181/JSPBasic/boardList">목록으로</a><br/><br/>
<form action="http://localhost:8181/JSPBasic/boardUpdate" method="post">
<input type="hidden" value="${board.board_num }" name="board_num"/>
<input type="submit" value="수정하기"/>
</form><br/>
<form action="http://localhost:8181/JSPBasic/boarddelete" method="post">
<input type="hidden" value="${board.board_num }" name="board_num"/>
<input type="submit" value="삭제하기"/>
</form>
</body>
</html>