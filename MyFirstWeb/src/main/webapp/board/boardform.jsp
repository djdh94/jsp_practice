<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:if test="${sessionScope.session_id eq null }">
<script>
location.href="http://localhost:8181/MyFirstWeb/boardList.do";
</script>
</c:if>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="http://localhost:8181/MyFirstWeb/boardInsert.do" method="post">

		<input type="text" name="title" placeholder="글제목" required><br>
		<input type="text" name="writer"  value="${sId }"readonly><br> <!-- sessionScope.session_id로 해줘도됨 -->
		<textarea rows="30" cols="50" name="content" placeholder="내용" required></textarea>
		<input type="submit" value="글쓰기">
	</form>
</body>
</html>