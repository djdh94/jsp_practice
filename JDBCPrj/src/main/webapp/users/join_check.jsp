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
    // 폼에서 날려준 데이터를 받아 변수에 저장
    String id = request.getParameter("fid");
    String pw = request.getParameter("fpw");
    String name = request.getParameter("fname");
    String email = request.getParameter("femail");
    
    // 위의 사용자가 입력한 데이터를 토대로
    // 스크립트릿 내부에서 db연동을 한다음 insert 구문을 실행하도록
    // 만들면 회원가입 구현가능
    
    // 1. DB종류 지정 및 연동
    try{
    Class.forName(dbType);
    Connection con = DriverManager.getConnection(dbUrl,dbId,dbPw);
    // 2. 쿼리문 작성 및 pstmt 생성
    
    String sql = "insert into userinfo value(?,?,?,?)";
    
    // 3. pstmt 실행으로 사용자가 보낸 폼 데이터 db에 저장
    
    PreparedStatement pstmt = con.prepareStatement(sql);
    
    pstmt.setString(1,name);
    pstmt.setString(2,id);
    pstmt.setString(3,pw);
    pstmt.setString(4,email);
    pstmt.executeUpdate();
    
    // 4. out.println("회원가입이 완료"); 띄어서 가입완료 알리기
    
    con.close();
    pstmt.close();
    }catch(Exception e){
    	e.getStackTrace();
    }finally{
    	out.println("회원가입 완료");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="login_form.jsp">로그인창으로 이동</a>
</body>
</html>