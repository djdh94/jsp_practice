<%@page import="kr.co.ict.UserDAO2"%>
<%@page import="kr.co.ict.UserDAO2"%>
<%@page import="kr.co.ict.UserVO2"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    /*String dbType="com.mysql.cj.jdbc.Driver";
    String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
    String dbId="root";
    String dbPw="mysql";
    Connection con=null;
    PreparedStatement pmt=null;
    ResultSet rs=null;
    List<UserVO> userList = new ArrayList<>();
    try{
    	Class.forName(dbType);
    	con=DriverManager.getConnection(dbUrl,dbId,dbPw);
    	String sql="select*from userinfo";
    	pmt=con.prepareStatement(sql);
    	rs=pmt.executeQuery();
    	while(rs.next()){
    		String name=rs.getString(1);
    		String id=rs.getString(2);
    		String pw=rs.getString(3);
    		String email=rs.getString(4);
    		UserVO userDate=new UserVO(name,id,pw,email);
    		userList.add(userDate);
    	}
    }catch(Exception e){
    	e.printStackTrace();
    }finally{
    	con.close();
    	pmt.close();
    	rs.close();
    }*/
  	UserDAO2 dao = UserDAO2.getInstance();
    List<UserVO2> UserList = dao.getAlltest();
    
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
	<%for(UserVO2 user : UserList){ %>
	<tr>
	<td><%=user.getuName() %></td>
	<td><%=user.getuId()%></td>
	<td><%=user.getuPw() %></td>
	<td><%=user.getuEmail() %></td>
	</tr>
	<%} %>
	</tbody>
</table>
</body>
</html>