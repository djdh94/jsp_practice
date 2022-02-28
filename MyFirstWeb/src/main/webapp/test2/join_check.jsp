<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id=request.getParameter("fid");
    String name=request.getParameter("fname");
    String pw=request.getParameter("fpw");
    String email=request.getParameter("femail");
    String dbType="com.mysql.cj.jdbc.Driver";
    String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
    String dbId="root";
    String dbPw="mysql";
    Connection con=null;
    PreparedStatement pmt=null;
    try{
    	Class.forName(dbType);
    	con=DriverManager.getConnection(dbUrl,dbId,dbPw);
    	String sql="insert into userinfo value(?,?,?,?)";
    	pmt=con.prepareStatement(sql);
    	pmt.setString(1, name);
    	pmt.setString(2, id);
    	pmt.setString(3, pw);
    	pmt.setString(4, email);
    	pmt.executeUpdate();
    	
    }catch(Exception e){
		e.printStackTrace();
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입 완료</h1>
	<a href="login_form.jsp">로그인 페이지로 돌아가기</a>
</body>
</html>