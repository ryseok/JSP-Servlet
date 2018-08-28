<%@page import="com.encore.t0710.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%--useBean_action.jsp 
    <useBean>태그는 특정 클래스의 객체 생성 역할
--%>
<jsp:useBean class="com.encore.t0710.Person" id="p" scope="page"/>
<%
    //Person p = new Person(); 
%>
<body>
  <h3>useBean_action.jsp</h3>
  <hr>
  <%= p %>
  <%
      p.setName("나길동");
  %>
  <jsp:setProperty property="age" name="p" value="13"/> <%-- p.setAge(13) --%>
  <jsp:setProperty property="job" name="p" value="학생"/>
  <br>
  <%= p %><br>
  이름1: <jsp:getProperty property="name" name="p"/><br>
  이름2: <%  out.print( p.getName() );  %>
</body>
</html>





