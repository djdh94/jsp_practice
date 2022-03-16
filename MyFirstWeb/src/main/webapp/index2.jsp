<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
    // 스크립트릿을 활용한 로그인 확인
	String sId = (String)session.getAttribute("session_id");    
    // 로그인 안 된 사용자의 sId값 체크
    System.out.println(sId==null);
    %>
    <c:set var="sId" value="<%=sId %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>메인페이지</h1>
<h2>web.xml 내부 welcomepage 설정에 index.jsp라고 적혀있어서</h2>
<h2>이 페이지가 메인페이지로 자동 설정됩니다.</h2>
<h2>welcomepage 설정을 고쳐서 index.jsp가 아닌</h2>
<h2>다은 임의의 명칭을 메인페이지로 만들어줄수도 있습니다.</h2>

<a href="http://localhost:8181/MyFirstWeb/boardList.do">게시판이동</a>


<c:if test="${sessionScope.session_id eq null }">
<a href="http://localhost:8181/MyFirstWeb/users/login_form.jsp">로그인창</a>
<a href="http://localhost:8181/MyFirstWeb/users/join_form.jsp">회원가입하기</a>
</c:if>
<!-- 로그아웃버튼은 로그인한 사용자한테만 보임. 로그아웃 버튼을 로그인한 사용자만 보이게 만들어서 태그를 1:1로 보내기 -->
<c:if test="${sessionScope.session_id ne null }">
<a href="http://localhost:8181/MyFirstWeb/users/login_logout.jsp">로그아웃</a>
</c:if>

</body>
</html>