<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    String id=(String)session.getAttribute("session_id");
    if(id==null){
    	response.sendRedirect("login_form.jsp");
    }
    String dbType="com.mysql.cj.jdbc.Driver";
    String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
    String dbId="root";
    String dbPw="mysql";
    Connection con=null;
    PreparedStatement pmt=null;
    try{
    	Class.forName(dbType);
    	con=DriverManager.getConnection(dbUrl,dbId,dbPw);
    	String sql="delete from userinfo where uid=?";
    	pmt=con.prepareStatement(sql);
    	pmt.setString(1, id);
    	pmt.executeUpdate();
    	
    }catch(Exception e){
    	e.printStackTrace();
    }finally{
    	con.close();
    	pmt.close();
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
	<h1>회원탈퇴 완료</h1>
</body>
</html>