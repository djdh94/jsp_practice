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