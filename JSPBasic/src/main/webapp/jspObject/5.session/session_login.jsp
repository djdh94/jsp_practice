<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // 로그인한 사용자가 해당 페이지에 접근했는지 안했는지 세션 조회로 체크
    String id=(String)session.getAttribute("session_id");
    String pw=(String)session.getAttribute("session_pw");
    String nickname=(String)session.getAttribute("session_nick");
    
    // 로그인된 상태라면 저장된 값이, 아니면 null이 콘솔에 찍힘
    //System.out.println(id);
    //System.out.println(pw);
    //System.out.println(nickname);
    
    // 위의값(id,pw,nickname)이 null이 아닌 경우는 로그인이 이미 된 상태
    // 세션은 login_check.jsp 에서 로그인로직을 통과한 경우에만 발급
    // 이를 이용해 세션이 값이 발급된 경우에는 welcome페이지로 리다이렉트 되도록
    if(id!=null){
    	response.sendRedirect("session_welcome.jsp");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="session_login_check.jsp" method="post">
	아이디 : <input type="text" name="id" required/><br/>
	비밀번호 : <input type="password" name="pw" required/><br/>
	닉네임 : <input type="text" name="nickname"/><br/>
	<input type="submit"/>
	<input type="reset"/>
	</form>
</body>
</html>