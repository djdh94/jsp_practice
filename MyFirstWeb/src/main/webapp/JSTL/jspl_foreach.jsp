<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
int total=0;
for(int i=1; i<101; i++){
	total+=i;
	
}out.println("<h1>1부터 100까지 총합은 : "+total+"</h1>");
--%>
<!-- begin 시작값 , end 끝값(100까지포함), step 증가숫자, var태그내에서 쓸 변수명 -->
<c:forEach begin="1" end="100" step="1" var="number">
<c:set var="total" value="${total+number }"/>
</c:forEach>
<h1>1~100까지 누적합:${total}</h1>
<hr/>
<!-- foreach문을 이용해서 구구단 4단을 출력하기 -->
<c:forEach begin="2" end="9" var="dan">
<hr/>
<c:forEach begin="1" end="9" var="i">
${dan}*${i}=${dan*i}<br/>
</c:forEach>
</c:forEach>



</body>
</html>