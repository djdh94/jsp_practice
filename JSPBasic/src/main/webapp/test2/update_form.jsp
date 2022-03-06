<%@page import="kr.co.ict.UserVO2"%>
<%@page import="kr.co.ict.UserDAO2"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
   String id =(String)session.getAttribute("session_id");
    if(id==null){
    	response.sendRedirect("login_form.jsp");
    }
  /* String dbType="com.mysql.cj.jdbc.Driver";
   String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
   String dbId="root";
   String dbPw="mysql";
   Connection con=null;
   PreparedStatement pmt=null;
   ResultSet rs=null;
   String fname=null;
   String fid=null;
   String femail=null;
   try{
	   Class.forName(dbType);
	   con=DriverManager.getConnection(dbUrl,dbId,dbPw);
	   String sql="select*from userinfo where uid=?";
	   pmt=con.prepareStatement(sql);
	   pmt.setString(1,id);
	   rs=pmt.executeQuery();
	   if(rs.next()){
		   fname=rs.getString("uname");
		   fid=rs.getString("uid");
		   femail=rs.getString("uemail");
	   }
   }catch(Exception e){
	   e.printStackTrace();
   }*/
	UserDAO2 dao = UserDAO2.getInstance();
   UserVO2 user=dao.getUpdatetest(id);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="update_check.jsp" method="post">
<input type="text" name="fname" value="<%=user.getuName()%>"/><br/>
<input type="text" name="fid" value="<%=user.getuId() %>"/><br/>
<input type="email" name="femail" value="<%=user.getuEmail() %>"/><br/>
<input type="password" name="fpw" placeholder="패스워드"/><br/>
<input type="submit" value="정보수정"/>
<input type="reset" value="초기화"/>

</form>
</body>
</html>