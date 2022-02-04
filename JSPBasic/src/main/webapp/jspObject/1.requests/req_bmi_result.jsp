
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    String height = request.getParameter("height");
    String weight = request.getParameter("weight");
    
    double cm = Double.parseDouble(height);
    double kg = Double.parseDouble(weight);
    
    // BMI 지수 계산공식
    double bmi=kg/(cm/100*cm/100);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%-- bmi 지수 계산공식=[체중/신장*신장]
 즉 175cm라면 실제 신장에 들어가야 할 값은
 1.75m * bmi 지수가 23을 초과한다면 "체중조절을 고려하세요."
 출력 18.5미만이라면 "저체중입니다" 출력
 나머지인 경우, "정상입니다" 출력하되 스크립트릿에
 if문을 넣어서 선택적으로 결과가 나오게 하기
 
 * 폼에서 전달되는 데이터는 무조건 문자열로 전달
 따라서 정수나 실수로 변환해야 하는데
 String -> int,double
 Integer.parseInt("문자열)==>문자열을 정수로
 Double.parseDouble("문자열")==>문자열을 실수로
  --%>
  <h1>BMI 계산 웹어플리케이션</h1>
  <hr/>
  
  -신장:<%=height %>cm<br/>
  -체중:<%=weight %>kg<br/>
  
  BMI 지수: <b><%=bmi %></b><br/>
  <%if(bmi>23){ %>
  <b>체중조절을 고려해보세요</b>
  <%}else if(bmi<18.5){ %>
  <b>저체중입니다</b>
  <%}else{ %>
  <b>정상입니다</b>
  <%} %>
</body>
</html>