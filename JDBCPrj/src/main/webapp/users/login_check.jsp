<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String dbType="com.mysql.cj.jdbc.Driver";
	String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId="root";
	String dbPw="mysql";
	
    request.setCharacterEncoding("utf-8");
    
    String fId = request.getParameter("fid");
    String fPw = request.getParameter("fpw");
    try{
    Class.forName(dbType);
    Connection con = DriverManager.getConnection(dbUrl,dbId,dbPw);
    String sql = "select*from userinfo where fid=?";
    PreparedStatement pst = con.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	
	if(fId.equals("fid")){
		if(fPw.equals("fpw")){
		out.println("로그인 성공");
		}
	}out.println("로그인 실패");
	
	
    
    
    	
    }catch(Exception e){
    	e.getStackTrace();
    }finally{
    	out.println("");
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