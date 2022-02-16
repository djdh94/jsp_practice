<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String dbType="com.mysql.cj.jdbc.Driver";
   	String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
   	String dbId="root";
   	String dbPw="mysql";
   	ResultSet rs = null;
   	Connection con=null;
   	PreparedStatement  pmt=null;
   	try{
   		Class.forName(dbType);
   		con = DriverManager.getConnection(dbUrl,dbId,dbPw);
   		
   		String sql = "select*from userinfo";
   		pmt = con.prepareStatement(sql);
   		
   		rs = pmt.executeQuery();
   		
   		/*while(rs.next()){
   			out.println(rs.getString("uname"));
   			out.println(rs.getString("uid"));
   			out.println(rs.getString("upw"));
   			out.println(rs.getString("uemail"));
   		}*/
   		
   	}catch(Exception e){
   		e.getStackTrace();
   	}finally{
   		//con.close();
   		//pmt.close();
   		//rs.close();
   	}
   	
   	
   	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
	<thead> 
	<tr>
	<th>유저이름</th>
	<th>유저아이디</th>
	<th>유저비번</th>
	<th>유저이메일</th>
	</tr>
	</thead>
	<tbody>
	<% while(rs.next()){%>
		
	<tr>
	<td><%=rs.getString(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=rs.getBoolean(4) %></td>
	</tr>
	<%} %>
	</tbody>
	</table>
</body>
</html>