<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원정보 출력</title>
</head>
<body>
<h3>사원정보 출력</h3>
<hr>
<table border="1" cellpadding="5">
<tr bgcolor="orange">
<th>사원번호</th>
<th>사원명</th>
<th>부서명</th>
<th>급여등급</th>
</tr>

<c:forEach items="${list }" var="emp">
	<tr>
	<td>${emp.empno}</td>
	<td>${emp.ename}</td>
	<td>${emp.dname}</td>
	<td>${emp.grade}</td>
	</tr>
</c:forEach>
</table>
</body>
</html>