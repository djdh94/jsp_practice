<%@page import="kr.co.ict.Test3"%>
<%@page import="kr.co.ict.UserDAO"%>
<%@page import="kr.co.ict.UserVO"%>
<%@page import="kr.co.ict.Test2"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = (String)session.getAttribute("session_id");
    if(id==null){
    	response.sendRedirect("login_form.jsp");
    }

    /*String dbType="com.mysql.cj.jdbc.Driver";
   	String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
   	String dbId="root";
   	String dbPw="mysql";
    
    
    String uname=null;
    String uemail=null;
    try{
    	Class.forName(dbType);
    	Connection con = DriverManager.getConnection(dbUrl,dbId,dbPw);
    	
    	String sql = "select*from userinfo where uid=?";
    	
    	PreparedStatement pmt = con.prepareStatement(sql);
    	
    	pmt.setString(1, id);
    	ResultSet rs = pmt.executeQuery();
    	
    	if(rs.next()){
    		uname=rs.getString("uname");
    		uemail=rs.getString("uemail");
    	}
    	
    	
    	
    }catch(Exception e){
    	e.getStackTrace();
    } */
    
   Test3 dao = new Test3();
    UserVO user = dao.getUserDate(id);
    out.println(user);
 
    
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="update_check.jsp" method="post">
	<input type="password" name="fpw" placeholder="패스워드"/><br/>
	<input type="text" name="fname" placeholder="이름" value="<%=user.getuName()%>"/><br/>
	<input type="email" name="femail" placeholder="이메일" value="<%=user.getuEmail()%>"/><br/>
	<input type="submit" value="수정"/>
	<input type="reset" value="초기화"/>
	</form>
	
</body>
</html>