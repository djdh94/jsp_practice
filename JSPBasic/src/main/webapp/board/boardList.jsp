<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table table-hover">
<thead>
<tr>
<td>글번호</td>
<td>글제목</td>
<td>글내용</td>
<td>글쓴이</td>
<td>수정날짜</td>
<td>최종수정날짜</td>
<td>조회수</td>
</tr>
</thead>
<tbody>
<c:forEach var="board" items="${boardList }">
<tr>
<td>${board.board_num }</td>
<td><a href="http://localhost:8181/JSPBasic/boarddetail?board_num=${board.board_num }">${board.title }</a></td>
<td>${board.content }</td>
<td>${board.writer }</td>
<td>${board.bdate }</td>
<td>${board.mdate }</td>
<td>${board.hit }</td>
</tr>
</c:forEach>
</tbody>
</table>
<a href="http://localhost:8181/JSPBasic/boardInsertForM"><button>글쓰기</button></a>
</body>
</html>