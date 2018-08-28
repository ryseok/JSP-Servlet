<%@page import="java.util.ArrayList"%>
<%@page import="com.encore.t0713.Emp"%>
<%@page import="com.encore.t0713.EmpDAO2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원정보</title>
</head>
<%--
	emp2.jsp
 	문제) 사원들의 사원번호, 사원명, 입사일을 HTML <table>에 출력하시오!!
--%>
<body>
  <%
    //jsp페이지내에서 JDBC를 직접 사용
    //---> JDBC관련코드를 DAO로 이동
    //DAO내의 DB연결속성(driver,url,user,password)을 properties파일 참조
    
    //application == ServeltContext == 웹어플리케이션 == TomTest
    EmpDAO2 dao = new EmpDAO2(application.getRealPath("/"));
    
    ArrayList<Emp> list = dao.selectAll();  
  %>
  <center>
    <h3>사원정보출력3</h3>
    <hr>
    <table border="1" cellpadding="5" width="300">
      <tr bgcolor="skybule" >
         <th>사원번호</th><th>사원명</th><th>입사일</th>
      </tr>
   <%  for(int i=0; i<list.size(); i++){
           Emp emp = list.get(i);
   %>  
      <tr>
         <td><%= emp.getEmpno() %></td>
         <td><%= emp.getEname() %></td>
         <td><%= emp.getHiredate() %></td>
      </tr>
    <%   }%>
    </table>
  </center>
  
</body>
</html>











