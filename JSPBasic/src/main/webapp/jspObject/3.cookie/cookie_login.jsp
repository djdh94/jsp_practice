<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    // auto login 관련해서 발급된 쿠키가 있는지 체크해서 쿠키가 없다면
    // 로그인 창을 보여주는 대신 바로 welcom페이지로 보내주세요.(cookie_check.jsp 참조)
    Cookie[] cookies = request.getCookies();
    
    String autoLogin = null;
    
    // 향상된 for문으로 처리 가능함.
    if(cookies != null){
    for(Cookie cookie: cookies){
    	autoLogin=cookie.getName();
    	System.out.println(autoLogin);
    	// null 값이 들어왔을떄 바로 equals를 쓰면 500에러발생
    	//short circuit를 이용해서 null 아닌 경우만 equals를 실행하도록 조건식 작성
    	if(autoLogin.equals("auto.login")){
    	
		  response.sendRedirect("coockie_welcome");
    	}
    	
			
    	}
    }
    
    %>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 로그인창은 form으로 구성하기 
input text 1개(유저아이디입력),input password 1개(비밀번호 입력)
input checkbox 1개(자동로그인)
목적지는 coockie_login.ok.jsp-->
	<form action="cookie_login.ok.jsp">
	아이디 : &nbsp;<input type="text" name="id"/><br/>
	패스워드 : &nbsp;<input type="password" name="pw"/><br/>
	자동로그인 : &nbsp;<input type="checkbox" name="auto" value="checkd"/>로그인<br/>
	<input type="submit" value="로그인"/>
	<input type="reset" value="초기화"/>
	
	</form>

</body>
</html>