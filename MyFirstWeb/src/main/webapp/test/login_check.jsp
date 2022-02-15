<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String dbType="com.mysql.cj.jdbc.Driver";
   	String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
   	String dbId="root";
   	String dbPw="mysql";
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    if(id==null){
    	response.sendRedirect("login_form.jsp");
    }
    
    try{
    	Class.forName(dbType);
    	Connection con = DriverManager.getConnection(dbUrl,dbId,dbPw);
    	String sql = "select*from userinfo where uid=?";
    	PreparedStatement pmt = con.prepareStatement(sql);
    	pmt.setString(1, id);
    	ResultSet rs=pmt.executeQuery();
    	
    	if(rs.next()){
    		rs.getString("uname");
    		String uid=rs.getString("uid");
    		String upw=rs.getString("upw");
    		rs.getString("uemail");
    		if(id.equals(uid) && pw.equals(upw)){
    			session.setAttribute("session_id", id);
    			session.setAttribute("session_pw", pw);
    			response.sendRedirect("login_welcome.jsp");
    		}else{
    			out.println("비밀번호가 틀렸습니다.");
    		}
    	}else{
    		out.println("아이디가 틀렸습니다.");
    	}
    }catch(Exception e){
    	e.getStackTrace();
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