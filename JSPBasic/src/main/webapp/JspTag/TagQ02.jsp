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
	
	int num=(int)(Math.random()*8)+2;
	public int total=0;
	%>
	
	<%
	out.println("페이지 누적요청수:"+(++total)+"<br/>");
	out.println("매 10번쨰 방문자에게는 기프티콘을 드립니다."+"<br/>");
	if(total%10==0){
		  out.println("당첨되셨습니다.");
		}
	out.println("<hr/>");
	
	out.println("<h1>"+"랜덤 구구단("+num+"단)"+"</h1>"+"<br/>");
	out.println("이번에 나온 구구단은"+num+"단입니다."+"<br/>");
	
	
	for(int i=1; i<10; i++){
		out.println(num+"*"+i+"="+num*i+"<br/>");
	}
	%>
	
</body>
</html>