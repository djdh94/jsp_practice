<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
본문:<textarea rows="15" cols="50" readonly>${board.content }</textarea><br/>
<a href="http://localhost:8181/MyFirstWeb/boardList.do">목록으로</a>

<c:if test="${sessionScope.session_id eq board.writer }">
<form action="http://localhost:8181/MyFirstWeb/boardDelete.do" method="post">
<input type="hidden" value="${baord.writer }" name="writer"/>
<input type="hidden" value="${board.board_num }" name="board_num"/> 
<input type="submit" value="삭제하기"/><br/>
</form>
<form action="http://localhost:8181/MyFirstWeb/boardUpdateForm.do" method="post">
<input type="hidden" value="${baord.writer }" name="writer"/>
<input type="hidden" value="${board.board_num }" name="board_num"/>
<input type="submit" value="수정하기"/>
</form>
</c:if>
</body>
</html>