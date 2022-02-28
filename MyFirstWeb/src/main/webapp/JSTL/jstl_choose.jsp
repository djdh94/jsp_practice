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
<!--  jstl_form2.jsp만들어서 목적지를 여기로하고
실제로 보낸 데이터가 여기서 출력되도록 -->
<c:choose>
<c:when test="${param.lang eq '자바'}">
당신은 자바로 웹개발합니다
</c:when>
<c:when test="${param.lang eq '파이썬'}">
당신은 파이썬으로 웹개발합니다
</c:when>
<c:otherwise>
당신은 php로 웹개발합니다
</c:otherwise>
</c:choose>
</body>
</html>