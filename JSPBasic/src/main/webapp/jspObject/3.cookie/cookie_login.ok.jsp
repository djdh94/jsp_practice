<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
 	// 폼에서 날아온 데이터들을 저장하기
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String autoLogin = request.getParameter("auto");
    
    System.out.println(autoLogin);
    
    if(id.equals("abcd")&& pw.equals("aaa1111")){
    	
    if(autoLogin !=null){
    Cookie auto = new Cookie("auto_login",id);
    // 쿠키 시간 설정
    auto.setMaxAge(50);
    // 쿠키는 생성했으면 발급까지 처리해야함.
    response.addCookie(auto);
    	}
    // 쿠키 발급 여부와 상관없이 로그인에 성공했으므로 웰컴패키지이동
    response.sendRedirect("cookie_welcom.jsp");
    }
 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인에 실패했습니다</h2>
	<a href="cookie_login.jsp">로그인화면으로 이동</a>
</body>
</html>