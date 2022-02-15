<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // 1. 세션에서 아이디를 얻어오기 . 세션결과값이 널이면 login_form.jsp로 이동
    String id = (String)session.getAttribute("session_id");
    if(id==null){
    	response.sendRedirect("login_form.jsp");
    }
    // 2. db연결
    
     String dbType="com.mysql.cj.jdbc.Driver";
	String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId="root";
	String dbPw="mysql";
	request.setCharacterEncoding("utf-8");
	// 상위지역에서 미리 tname,temail을 선언 및 초기화해놔야
	// 표현식에서 저장된 값을 활용 할 수있다.
	
	String tname="";
	String temail=null;
	try{
	Class.forName(dbType);
	Connection con = DriverManager.getConnection(dbUrl,dbId,dbPw);
	
    // 3. 로그인된 아이디의 전체 정보(select*from..)을 얻어오기
    String sql="select*from userinfo where uid=?";
    
    PreparedStatement pmt = con.prepareStatement(sql);
    pmt.setString(1, id);
    ResultSet rs = pmt.executeQuery();
 	// 4. name,eamil을 변수에 저장 
	// 데이터가 안들어왔을 상황을 대비해 rs.next()는 if문의 조건절에 넣어서 실행
	if(rs.next()){
		tname=rs.getString("uname");
		temail=rs.getString("uemail");
		
	}
 	con.close();
 	pmt.close();
    
    
	}catch(Exception e){
		e.getStackTrace();
	}finally{
		
	}
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=id %> 계정의 정보를 수정합니다.
	<!-- update의 경우는 update_check.jsp로 자료롤 보내야 하는데
	보통 정보 수정을 하는 경우는 , 미리 회원정보가 form에 기입되어
	있는 경우가 많습니다. 먼저 폼 양식은, 아이디 없이 비밀번호는
	비어있고, name,email은 db에있던 정보가 채워진 상태로 창이
	열리게 만들기.
	input 태그에서 value 속성을 이용하면 미리 채워질 값을 지정할수있음 -->
	<form action="update_check.jsp" method="post">
	<input type="password" name="fpw" placeholder="패스워드" /><br/>
	<input type="text" name="fname" placeholder="이름" value="<%=tname%>"/><br/>
	<input type="email" name="femail" placeholder="이메일" value="<%=temail%>"/><br/>
	<input type="submit" value="수정"/>
	<input type="reset" value="초기화"/>
	
	
	</form>
</body>
</html>