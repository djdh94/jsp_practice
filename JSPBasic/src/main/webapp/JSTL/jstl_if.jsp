
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--begin 시작값, end 끝값(포함함) step 증가숫자 var 변수명--%>
<c:forEach begin="1" end="100" step="1" var="number">
<c:set var="total" value="${total+number }"/>
</c:forEach>
<c:out value="${total }"></c:out>
<hr/>

<c:forEach begin="2" end="9" var="dan">
<hr/>
<c:forEach begin="1" end="9" var="i">
<c:out value="${dan}*${i}=${dan*i}"></c:out><br/>
</c:forEach>
</c:forEach>

<%--arr변수 내에 과일 5개이름을 배열로 저장하는 구문  --%>
<c:set var="arr" value='<%=new String[]{"사과","딸기","포도"} %>'/>
<c:forEach var="i" items="${arr }">
${i }
</c:forEach>

<c:set var="arr2" value='<%=new int[]{10,20,30} %>'/>
<c:forEach var="a" items="${arr2}">
${a }
</c:forEach>
</body>
</html>