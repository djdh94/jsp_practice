<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("session_id");
	String pw = request.getParameter("fpw");
    String name=request.getParameter("fname");
    String email=request.getParameter("femail");
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
	   String sql="update userinfo set uname=?,uemail=?,upw=? where uid=?";
	   pmt=con.prepareStatement(sql);
	   pmt.setString(1,name);
	   pmt.setString(2,email);
	   pmt.setString(3, pw);
	   pmt.setString(4, id);
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
<h1>정보 수정 완료했습니다</h1>

</body>
</html>