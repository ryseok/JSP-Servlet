<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--미션1-->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>사원정보 출력</title>
	</head>

	
	<body>
		<h3>사원정보</h3>
		<hr>
		<table border="1" cellpadding="5">
			<tr>
			<th>사원번호</th>
			<th>사원명</th>
			<th>입사일</th>
			<th>급여</th>
			<th>부서명</th>
			</tr>

		<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
		System.out.println("DB 연결 성공");
		
		String sql="select empno,ename,hiredate,sal,dname from emp natural join dept";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){  //사원의 수만큼 %>
		<tr>
		<td><%=rs.getInt("empno") %></td>
		<td><%=rs.getString("ename") %></td>
		<td><%=rs.getString("hiredate") %></td>
		<td><%=rs.getInt("sal") %></td>
		<td><%=rs.getString("dname") %></td>
		</tr>
		<% } %>
		</table>
	</body>
</html>