<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		//DAO에서 ConnectionPool,DBCP사용 ===> 빠른 서비스
		//컨트롤러 등장(컨트롤러에서 모델객체생성,호출,저장)
		//application == ServeltContext == 웹어플리케이션 == TomTest
		//MVC (jstl,el 사용)

		
	%>
	<center>
		<h3>사원정보출력6</h3>
		<hr>
		<table border="1" cellpadding="5" width="300">
			<tr bgcolor="skyred">
				<th>사원번호</th>
				<th>사원명</th>
				<th>입사일</th>
			</tr>
			
			<c:forEach items="${empList}" var="emp">
			<tr>
				<td>${emp.empno}</td>
				<td>${emp.ename}</td>
				<td>${emp.hiredate}</td>
			</tr>
			</c:forEach>
		
		</table>
	</center>

</body>
</html>