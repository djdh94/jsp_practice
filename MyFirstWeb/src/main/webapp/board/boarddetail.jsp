<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${board.board_num}번 글 상세페이지</h1>
글제목:<input type="text" value="${board.title }" readonly>
글쓴이:<input type="text" value="${board.writer }" readonly>
조회수:${board.hit }<br/>
날짜:<input type="text" value="${board.bdate }" readonly>
마지막 수정날짜:${board.mdate }<br/>
본문:<textarea rows="15" cols="50">${board.content }</textarea><br/>
<a href="http://localhost:8181/MyFirstWeb/boardlist">목록으로</a>
</body>
</html>