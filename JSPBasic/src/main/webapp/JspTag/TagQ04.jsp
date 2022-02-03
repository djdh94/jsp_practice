<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--jsp 주석은 이렇게함 
	jsp주석은 소스보기에 안나타남--%>
	<!-- html주석은 소스보기에 나타남 -->
	<%!
	double celcius=-5.0;
	double CtoF(double celcius){
		return celcius*1.8+32;
	}
	
	%>
	<h1>오늘 현재 동교동 온도</h1>
	<%
	out.println("섭씨온도: <b>"+celcius+"</b"+"<br/>");
	out.println("섭씨온도: <b>"+CtoF(celcius)+"</b");
	%>

	
</body>
</html>