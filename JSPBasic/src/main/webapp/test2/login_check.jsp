<%@page import="kr.co.ict.UserVO2"%>
<%@page import="kr.co.ict.UserDAO2"%>
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
   /*String dbType="com.mysql.cj.jdbc.Driver";
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
	   rs=pmt.executeQuery();*/ 
	   UserDAO2 dao = new UserDAO2();
	   UserVO2 user= dao.getUpdatetest(id);
	   
	   if(user!=null){
	   //String uid=user.getuId();
	   //String upw=user.getuPw();
		   //String uid=rs.getString("uid");
		   //String upw=rs.getString("upw");
		   if(id.equals(user.getuId())&& pw.equals(user.getuPw())){
			   session.setAttribute("session_id", user.getuId());
			   session.setAttribute("session_pw", user.getuPw());
			   response.sendRedirect("login_welcome.jsp");
		   }else{
			   out.println("비밀번호가 틀렸습니디");
		   }
	   }else{
		   out.println("아이디가 틀렸습니다");
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