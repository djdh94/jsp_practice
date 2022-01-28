<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%!
		 //Declaration 내부에 1~10범위의 난수를 리턴하는 메서드
		 // int randomNumber()를 선언해주세요.
		int randomNumber(){
		// 정수1~10까지 발생시켜서 리턴하도록 로직작성
		int result=(int)(Math.random()*10)+1;
		return result;
	}
		String randomColor(){
		// 33% 확률로 빨강,노랑,파랑
		// 난수발생
		double randomNum = Math.random();
		String result;
		if(randomNum <0.33){
			result="빨강";
		}else if(randomNum<0.66){
			result="파랑";
		}else{
			result="노랑";
		}
			
		return result;
	}
		 
	%>
	
	<h3>오늘의 행운의 숫자와 행운의 색깔</h3>
	<p>행운의 숫자는 1~10범위입니다.</p>
	<p>행운의 숫자:<b><%=randomNumber() %></b></p>
	<p>행운의 색깔:<b><%=randomColor() %></b></p>

</body>
</html>