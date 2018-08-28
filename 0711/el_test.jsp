<%@page import="com.encore.t0710.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EL테스트</title>
</head>
<%-- el_test.jsp --%>
<body>
<%
     //영역에 데이터 저장   ----> MVC에서는 주로 Controller가 담당!! 
     pageContext.setAttribute("k1", "홍길동");//잘 사용하지 않음
     request.setAttribute("k2", "길라임");//자주사용
     session.setAttribute("k3", "김주원");//자주사용
     application.setAttribute("k4", "대한민국");
     
     request.setAttribute("k5", new Person("김유신",14,"화랑"));
     session.setAttribute("k5", "장동건");
     application.setAttribute("k5", "한혜진");
     int su=33;
%>
  <h3>ExpressionLanguage(EL)테스트</h3>
  <hr>
  k1: <% String data = (String)pageContext.getAttribute("k1"); %>
      <%= data %> <br>
  k2: <%= request.getAttribute("k2") %><br>
  k3: <%= session.getAttribute("k3") %><br>
  k4: <%= application.getAttribute("k4") %><br>
  k5(request): <%= request.getAttribute("k5") %><br>
  k5(session): <%= session.getAttribute("k5")%> <br>
  k5(application): <%= application.getAttribute("k5")%> <br>
  su: <%= su %><br>
  k6: <%= request.getAttribute("k6") %>
  
  <hr color="red">
  <h4>EL통한 데이터 출력</h4>
  k1: ${k1 }<br>
  k2: ${k2 } <br>
  k3: ${k3 } <br>
  k4: ${k4 } <br>
  k5(request) : ${k5 }<br>
                ${requestScope.k5 }<br>
                <font color="blue">이름: ${k5.name }</font><br>
                <font color="blue">나이: ${k5.age }</font><br>
                <font color="blue">직업: ${k5.job }</font><br>
                
  k5(session) : ${sessionScope.k5 } <br>
  k5(application) : ${applicationScope.k5 } <br>
  su(영역X,지역변수): ${su }  EL은 지역변수 사용 불가<br>
  k6(정의되지 않는 키값): ${k6 } 없는 키값은 빈문자열 출력<br>
  <hr color="orange">
  <h3>입력폼</h3>
  <form action="print.jsp" method="post">
     이름: <input type="text" name="username"><br>
     나이: <input type="text" name="age"><br>
     <input type="submit" value="전송">
  </form>
</body>
</html>
















