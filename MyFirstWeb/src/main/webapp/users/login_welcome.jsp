<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
     
    String id = (String)session.getAttribute("session_id");
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
	<%=id %>님 로그인 환영합니다.<br/>
	<a href="login_update.jsp">정보수정하기</a><br/>
	<a href="login_logout.jsp">로그아웃</a><br/>
	<a href="member_out.jsp">회원탈퇴</a><br/>
	<!--  회원목록보기 링크 만들기 -->
	<a href="user_list2.jsp">회원목록보기</a>
	
</body>
</html>