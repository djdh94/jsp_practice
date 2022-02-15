<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    // 1. form에서 보낸 비번,이름,이메일 변수로 저장
    request.setCharacterEncoding("utf-8");
    String pw = request.getParameter("fpw");
    String name = request.getParameter("fname");
    String email = request.getParameter("femail");
    // 2. session에 저장된 아이디를 변수로 저장
    String id = (String)session.getAttribute("session_id");
    if(id==null){
    	response.sendRedirect("login_form.jsp");
    }
    // 3. DB접속정보 변수로 관리
    String dbType="com.mysql.cj.jdbc.Driver";
	String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId="root";
	String dbPw="mysql";
    // 4. 연결
    try{
    	Class.forName(dbType);
    	Connection con = DriverManager.getConnection(dbUrl,dbId,dbPw);
    	// 5. pstmt생성 및 ?에 값 세팅
    	String sql = "update userinfo set uname=?,upw=?,uemail=? where uid=?";
    	
    	PreparedStatement pmt = con.prepareStatement(sql);
    	// 6. pstmt 실행 및 자원 회수
    	pmt.setString(1, name);
    	pmt.setString(2, pw);
    	pmt.setString(3, email);
    	pmt.setString(4,id);
    	pmt.executeUpdate();
    	con.close();
    	pmt.close();
    }catch(Exception e){
    	e.getStackTrace();
    }
    
    		
    
	 // 7.body태그에 xxx회원의 정보가 수정되었습니다. 라고 안내하고
    // 웰컴페이지로 돌아갈수있는 링크 넣기
   	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1><%=id %></h1>정보가 수정되었습니다.
	<a href="login_welcome.jsp">웰컴페이지로 돌아가기</a>
</body>
</html>