 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>

<hr/>
<table class="table table-hover">
		<tr>
			<th>글 번호</th>
			<th>글 제목</th>
			<th>글쓴이</th>
			<th>쓴날짜</th>
			<th>최종수정날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="board" items="${boardList }">
			<tr>
				<td>${board.board_num}</td>
				<td><a href="http://localhost:8181/MyFirstWeb/boarddetail.do?board_num=${board.board_num }">${board.title}</a></td>
				<td>${board.writer}</td>
				<td>${board.bdate}</td>
				<td>${board.mdate}</td>
				<td>${board.hit}</td>
			</tr>
			
		</c:forEach>
	</table>
	
	<c:if test="${sessionScope.session_id ne null }">
<a href="http://localhost:8181/MyFirstWeb/boardInsertForm.do"><button>글쓰기</button></a>
</c:if>

${dto }
		<!-- document의 pagination 파트를 보고 1부터 10까지 나열해보세요. -->
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	    <li class="page-item ${dto.startPage eq 1 ? 'disabled' : '' }">
	    	<a class="page-link" href="http://localhost:8181/MyFirstWeb/boardList.do?pageNum=${dto.startPage - 1}">&laquo;</a>
	    </li>
		    <c:forEach var="pageIndex" begin="${dto.startPage }" end="${dto.endPage }">
		 	   <li class="page-item ${dto.currentPage eq pageIndex ? 'active' : '' }"><a class="page-link" href="http://localhost:8181/MyFirstWeb/boardList.do?pageNum=${pageIndex }">${pageIndex }</a></li>
			</c:forEach>
	    <li class="page-item ${dto.totalPages eq dto.endPage ? 'disabled' : ''}">
	    	<a class="page-link" href="http://localhost:8181/MyFirstWeb/boardList.do?pageNum=${dto.endPage + 1}">&raquo;</a>
	    </li>
	  </ul>
	</nav>

	<h3>부트스트랩 없이 만들기</h3>
	<c:if test="${dto.startPage ne 1 }">
		<a href="http://localhost:8181/MyFirstWeb/boardList.do?pageNum=${dto.startPage - 1}">이전</a>
	</c:if>
	<c:forEach var="pageIndex" begin="${dto.startPage }" end="${dto.endPage }">
	<c:if test="${dto.currentPage eq pageIndex }">
	<a href="http://localhost:8181/MyFirstWeb/boardList.do?pageNum=${pageIndex }"><b>[${pageIndex }]</b></a>
	</c:if>
	<c:if test="${dto.currentPage ne pageIndex }">
	<a href="http://localhost:8181/MyFirstWeb/boardList.do?pageNum=${pageIndex }">[${pageIndex }]</a>
	</c:if>
	</c:forEach>
	<c:if test="${dto.totalPages ne dto.endPage }">
		<a href="http://localhost:8181/MyFirstWeb/boardList.do?pageNum=${dto.endPage + 1}">다음</a>
	</c:if>


</body>
</html>