<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String id=(String)session.getAttribute("session_id");
    if(id==null){
    	response.sendRedirect("login_form.jsp");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=id %>님 환영합니다.<br/>

<a href="update_form.jsp">정보수정</a><br/>
<a href="memberout.jsp">회원탈퇴</a><br/>
<a href="logout.jsp">로그아웃</a><br/>
</body>
</html>