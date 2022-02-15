<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = (String)session.getAttribute("session_id");
    String dbType="com.mysql.cj.jdbc.Driver";
   	String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
   	String dbId="root";
   	String dbPw="mysql";
   	if(id==null){
   		response.sendRedirect("login_form.jsp");
   	}
   	try{
   		Class.forName(dbType);
   		Connection con = DriverManager.getConnection(dbUrl,dbId,dbPw);
   		
   		String sql = "delete from userinfo where uid=?";
   		PreparedStatement pmt = con.prepareStatement(sql);
   		
   		pmt.setString(1, id);
   		pmt.executeUpdate();
   		con.close();
   		pmt.close();
   			
   	}catch(Exception e){
   		e.getStackTrace();
   	}finally{
   		session.invalidate();
   		
   	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	삭제완료
	<a href="login_form.jsp">로그인으로 돌아가기</a>
</body>
</html>