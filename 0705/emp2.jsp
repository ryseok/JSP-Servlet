<%@page import="com.encore.t0704.vo.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.encore.t0704.dao.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--미션2-->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>사원정보 출력</title>
	</head>

	
	<body>
		<h3>사원정보</h3>
		<hr>
		<table border="1" cellpadding="5" bgcolor="blue">
			<tr>
			<th>사원번호</th>
			<th>사원명</th>
			<th>입사일</th>
			<th>급여</th>
			<th>부서명</th>
			</tr>
		<%
		EmpDAO dao = new EmpDAO(application.getRealPath("/")); 
		ArrayList<Emp> list = dao.findAll();
		for(int i=0; i<list.size(); i++){  
		Emp emp = list.get(i);
		%>
		<tr> <!--사원의 수만큼 -->
		<td><%=emp.getEmpno() %></td>
		<td><%=emp.getEname() %></td>  
        <td><%=emp.getHiredate() %></td>  
        <td><%=emp.getSal() %></td>  
        <td><%=emp.getDname() %></td> 
		</tr>
		<% } %> 
		</table>
	</body>
</html>