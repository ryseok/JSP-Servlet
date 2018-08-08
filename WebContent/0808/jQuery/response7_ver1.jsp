<%@page import="com.encore.s0713.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.encore.s0713.EmpDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--스스로 해결함 --%>
<%
	EmpDAO dao = new EmpDAO();
	ArrayList<Emp> list = dao.selectAll();
%>
<h3>사원명 출력</h3>
<hr>
<ol>
	<%
		for (int i = 0; i < list.size(); i++) {
			Emp emp = list.get(i);
	%>
	<li><%=emp.getEname()%></li>
	<% } %>
</ol>

