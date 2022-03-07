<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${boardList }
<hr/>
전체 데이터 :${boardList[0] }<br/>
글번호 : ${boardList[0].board_num }<br/>
글제목: ${boardList[0].title }<br/>

</body>
</html>