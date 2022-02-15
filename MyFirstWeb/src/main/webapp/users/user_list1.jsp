<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    // 전체 유저 목록을 가져오는 코드를 작성하기
    
    // 1. db접속 변수 생성
    String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	ResultSet rs =null; // try진입전에 선언해야 문서 전체적으로 쓸수있음
	Connection con = null;
	PreparedStatement pmt = null;
	
	try{
		// 2. 연결
		Class.forName(dbType);
		con = DriverManager.getConnection(dbUrl,dbId,dbPw);
		// 3. select*from userinfo 실행 및 리절트셋에 저장
		String sql="select*from userinfo";
		pmt = con.prepareStatement(sql);
		
		rs = pmt.executeQuery();
		/*
		while(rs.next()){
			System.out.println("회원이름:"+rs.getString("uname"));
			System.out.println("회원아이디:"+rs.getString("uid"));
			System.out.println("회원패스워드:"+rs.getString("upw"));
			System.out.println("회원이메일:"+rs.getString("uemail"));
			System.out.println("===============");
		}
		*/
		// .close()로 자원회수하는것을 try블럭 내부에 작성해두면
		// 평상시에는 상관없지만 모종의 이유로 에러가 발생하였을때 자원회수를 못할수도있음
		// 그래서 finally내부에 넣어줘야함
		//con.close();
		//pmt.close();
	}catch(Exception e){
		e.getStackTrace();
	}finally{
		// finally는 try와 블럭지역이 다르기 때문에
		// try진입전에 미리 선언해둬야 아래와 같이 .close()구문을 적을수있음
		// 문제는 현재 이 구문에서 rs.next()가 rs.close를 한 이후에 배치되서
		// 에러발생
		con.close();
		pmt.close();
		rs.close();
	}
    
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  테이블 태그를 생성하기
	테이블은 첫줄에 유저이름,유저아이디,비번,이멩리 순으로 나오고
	 두번쨰부터 반복문으로 해당 유저관련 정보가 나오도록 하기-->
	
	<table border="1">
		<thead>
			<tr>
				<th>유저이름</th>
				<th>유저아이디</th>
				<th>유저비밀번호</th>
				<th>유저이메일</th>
			</tr>
		</thead>
		<tbody>
			<% while(rs.next()){ %>
			<tr>
			<td><%=rs.getString("uname")%></td>
			<td><%=rs.getString("uid")%></td>
			<td><%=rs.getString("upw")%></td>
			<td><%=rs.getString("uemail")%></td>
			</tr>
			<%} %>
			
		</tbody>
	</table>
</body>
</html>