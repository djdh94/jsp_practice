<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    /*
    - 세션에 저장된 데이터는 브라우저 창이 종료될때까지,혹은 세션의
    유효시간이 만료되기 전까지 웹어플리케이션의 모든 JSP페이지에서 사용가능
    
    - 세션에 저장된 데이터를 가져오려면 session 객체의 getAttribute() 메서드를
    사용하며, 매개값으로 가져올 데이터의 세션 이름을 적어줍니다.
    */
    
    String userId = (String)session.getAttribute("id_session");
    out.println(userId+"<br/>");
    // 나머지 세션도 화면에 표시하기
    String userId2 = (String)session.getAttribute("name_session");
    out.println(userId2+"<br/>");
    
    String userId3 = (String)session.getAttribute("JSP");
    out.println(userId3+"<br/>");
    out.println("------------<br/>");
    
    // 세션의 유효시간은 아래의 메서드를 사용합니다.
    // 기본 시간은 30분으로 세팅되어 있고(디폴트) 바꾼다면 초단위로 바꿀수있음
    session.setMaxInactiveInterval(1800);
    // getMaxInactiveInterval()로 남은 시간 조회 가능
    int sTime = session.getMaxInactiveInterval();
    out.println("세션의 유효시간 : "+ sTime+"초<br/>");
    
    // 특정 세션 데이터만 삭제하기
    userId2= (String)session.getAttribute("name_session");
    out.println("name_session 삭제전 : " +userId2+"<br/>");
    
    //특정한 세션만 삭제시는 removeAttribute("세션이름"); 이용
    // name_session 삭제 후 삭제가 잘 되었는지 화면에 찍어서 확인하기
    session.removeAttribute("name_session");
    
    userId2=(String)session.getAttribute("name_session");
    out.println("name_session 삭제 후 : " +userId2+"<br/>");
    
    // 세션 일괄적으로 삭제하기
    userId = (String)session.getAttribute("id_session");
    out.println("id_session 삭제전 : "+userId+"<br/>");
    
    userId3 = (String)session.getAttribute("JSP");
    out.println("JSP 삭제전 : "+userId3+"<br/>");
    
    // 세션 전체적으로 다 삭제
    session.invalidate();
    
    //유효 세션 존재 여부 조회하기
    // request.isRequestedSessionIdValid()
  	if(request.isRequestedSessionIdValid()){
  		out.println("유효한 세션 존재");
  	}else{
  		out.println("세션이 파기되어 조회");
  	}out.println("---------<br/>");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>