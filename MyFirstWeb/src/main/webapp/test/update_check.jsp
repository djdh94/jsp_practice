<%@page import="kr.co.ict.UserDAO"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String pw = request.getParameter("fpw");
    String name = request.getParameter("fname");
    String email = request.getParameter("femail");
    
    String id = (String)session.getAttribute("session_id");
    
    /*String dbType="com.mysql.cj.jdbc.Driver";
   	String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
   	String dbId="root";
   	String dbPw="mysql";
   	Connection con = null;
   	PreparedStatement pmt=null;
   	try{
   		Class.forName(dbType);
   		con = DriverManager.getConnection(dbUrl,dbId,dbPw);
   		
   		String sql = "update userinfo set uname=?,upw=?,uemail=? where uid=?";
   		
   		pmt = con.prepareStatement(sql);
   		
   		pmt.setString(1, name);
   		pmt.setString(2, pw);
   		pmt.setString(3, email);
   		pmt.setString(4, id);
   		
   		pmt.executeUpdate();
   		
   		
   		
   		
   		
   	}catch(Exception e){
   		e.getStackTrace();
   	}finally{
   		con.close();
   		pmt.close();
   		
   	}*/
   	UserDAO dao = new UserDAO();
   	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원정보가 수정되었습니다.</h1>
	<a href="login_welcome.jsp">웰컴페이지</a>
</body>
</html>