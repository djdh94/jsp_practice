<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
	form태그를 만들고 목적지는 travel_check.jsp,post방식
	라디오 버튼 최소4개
	라디오버튼에는 value= 뭘 선택햇는지 식별가능하도록
	각 버튼별로 다른 value값지정
	
	submit버튼도 생성
	 --%>
	 <form action="travel_check.jsp" method="post">
	 중국<input type="radio" name="city" value="china"/><br/>
	 한국<input type="radio" name="city" value="korea"/><br/>
	 일본<input type="radio" name="city" value="jappan"/><br/>
	 미국<input type="radio" name="city" value="usa"/><br/>
	 <input type="submit"/>
	 
	 </form>
</body>
</html>