<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.encore.t0706.vo.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="com.encore.t0706.dao.EmpDAO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원정보 출력</title>
</head>
<body>
<h3>사원정보, 급여등급 출력</h3>
<table border="1" cellpadding="5">
			<tr>
			<th>사원번호</th>
			<th>사원명</th>
			<th>부서명</th>
			<th>급여등급</th>
			</tr>
		<%
			EmpDAO dao = new EmpDAO();
			ArrayList<Emp> list = dao.selectGradeInfo();
			for(int i=0; i<list.size(); i++){
				Emp emp = list.get(i);
				out.print("<tr><td>"+emp.getEmpno()+"</td><td>"+emp.getEname()+"</td>");
	        	out.print("<td>"+emp.getDname()+"</td><td>"+emp.getGrade()+"</td></tr>");
			}
		
		%>
		</table>
</body>
</html>