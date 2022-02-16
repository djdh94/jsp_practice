<%@page import="kr.co.ict.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.ict.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    // 아까 발생했던 rs.close() 실행 문제로 인해 
    // DB에 있는 자료를 꺼냈을때, 곧바로 java 데이터로 받아오는 작업을 수행한다음
    // rs.close()를 하면 문제가 없습니다.
    // 따라서 select 구문의 결과(sql데이터)를 담을 클래스가 필요하고
    // 이를 vo(value object)라고 부릅니다.
    // vo는 클래스이기 떄문에 src/main/java에 클래스를 선언 및 정의합니다.
    // UserVO.class 만들기
    /*
    // 1. DB접속 변수 생성
    String dbType="com.mysql.cj.jdbc.Driver";
   	String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
   	String dbId="root";
   	String dbPw="mysql";
   	Connection con=null;
   	PreparedStatement pmt=null;
   	ResultSet rs = null;
    
   	// ArrayList<UserVO> 자료형을 이용해 한줄 한줄 단위로 여러row를 저장합니다.
   	List<UserVO> userList = new ArrayList<>();
    try{
    	// 2. 연결
    	Class.forName(dbType);
    	con = DriverManager.getConnection(dbUrl,dbId,dbPw);
    	// 3. select*from userinfo 실행 및 resultset 저장
    	String sql = "select*from userinfo";
        pmt = con.prepareStatement(sql);
        rs = pmt.executeQuery();
        while(rs.next()){
        	// 1. ResultSet에서 데이터 가져오기
        	String uName=rs.getString("uname");
        	String uId=rs.getString("uid");
        	String uPw=rs.getString("upw");
        	String uEmail=rs.getString("uemail");
        	
        	UserVO userDate = new UserVO(uName,uId,uPw,uEmail);
        	userList.add(userDate);
        	
        }
        System.out.println(userList);
        out.println(userList+"<br/>");
        // 테이블에 저장된 데이터를 자바로 옮기기 위해서 UserVO를 선언했습니다
        // UserVO 하나 생성으로 몇 row에 해당하는 데이터를 받아올 수 있을까요?
        
        
    }catch(Exception e){
    	e.getStackTrace();
    }finally{
    	// 이 영역에서 바로 .close()를 쓰고도 데이터를 body태그에서 쓰려면
    	// .close() 이전에 db에 있던 데이터를 모조리 자바로 옮겨야함
    	//con.close();
    	//pmt.close();
    	//rs.close();
    }*/
    
    // 모든 접속정보는 UserDAO 클래스 내에 있습니다.
    // 따라서 UserDAO를 생성하는 것으로 접속정보 설정이 끝납니다.
    
   	UserDAO dao = new UserDAO(); // DB종류 지정까지 완료
    // dao 내부에 userinfo 테이블 전체의 데이털르 가져오는
    // getAllUserList()를 호출하는 것으로 필요 데이터 적재가 끝납니다.
    List<UserVO> userList=dao.getAllUserList(); // db내 전체 데이터를 우측에 배달받아 좌변에 저장(대입)
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  향상된 for문을 이용해서 userList내부의 데이터를
	Table형태로 user_list1과 동일한 양식으로 화면에 출력
	 -->
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
	 <% for(UserVO user: userList){%>
	 <tr>
	 <td><%=user.getuName() %></td>
	 <td><%=user.getuId() %></td>
	 <td><%=user.getuPw() %></td>
	 <td><%=user.getuEmail() %></td>
	 </tr>
	 <% }%>
	 </tbody>
	 
	 </table>	 
	 
</body>
</html>