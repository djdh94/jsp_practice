<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    request.setCharacterEncoding("utf-8");
    String id=request.getParameter("fid");
    String pw=request.getParameter("fpw");
    if(id==null){
    	response.sendRedirect("login_form.jsp");
    }

   String dbType="com.mysql.cj.jdbc.Driver";
   String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
   String dbId="root";
   String dbPw="mysql";
   Connection con=null;
   PreparedStatement pmt =null;
   ResultSet rs=null;
   try{
	   Class.forName(dbType);
	   con=DriverManager.getConnection(dbUrl,dbId,dbPw);
	   String sql="select*from userinfo where uid=?";
	   pmt=con.prepareStatement(sql);
	   pmt.setString(1,id);
	   rs=pmt.executeQuery();
	   if(rs.next()){
		   String uid=rs.getString("uid");
		   String upw=rs.getString("upw");
		   if(pw.equals(upw)){
			   session.setAttribute("session_id", uid);
			   session.setAttribute("session_pw", upw);
			   response.sendRedirect("login_welcome.jsp");
		   }
	   }else{
		   out.println("아이디가 틀렸습니다");
	   }
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

</body>
</html>