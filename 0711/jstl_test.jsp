<%@page import="com.encore.t0710.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSTL테스트</title>
</head>
<%-- jstl_test.jsp --%>
<body>
	<h3>JSTL(JSP Standard Tag Library)테스트</h3>
	<hr>
	<%-- <%  if(조건식){} %> --%>
	<c:if test="true">
     HTML마크업,text <br>
        조건식 참일때 실행 <br>
	</c:if>

	<c:if test="some text">
     Some Text
 	</c:if>

	<c:if test="${2<3 }">
     2는 3보다 작다!!<br>
	</c:if>

	<!--나이 테스트-->
	<c:if test="${param.age<20 }">
		<font color="blue">나이가 20미만 입니다.</font>
		<br>
	</c:if>

	<c:if test="${param.age >=20 }">
		<font color="blue">나이가 20이상 입니다.</font>
		<br>
	</c:if>

	<c:if test="${param.age >=20 && param.age <30 }">
		<font color="blue">나이가 20대 입니다.</font>
		<br>
	</c:if>
	<hr>
	<!--나이 20대와 30대 체크-->

	<c:choose>
		<%--if ~ else 문과 유사함--%>
		<c:when test="${param.age >=20 && param.age <30 }">
			<font color="green">나이가 20대 입니다.</font>
			<br>
		</c:when>

		<c:when test="${param.age >=30 && param.age <40 }">
			<font color="green">나이가 30대 입니다.</font>
			<br>
		</c:when>

		<c:otherwise>
			<font color="green">나이가 20대 또는 30대 아닙니다.</font>
			<br>
		</c:otherwise>
	</c:choose>
	<hr>
	<h4>forEach테스트</h4>
	<c:forEach begin="1" end="10" var="i" step="2" varStatus="stat">
		인덱스 : ${stat.index}, 카운트 : ${stat.count}
		<c:if test="${stat.count%2 == 0 }">
			<font color="blue">JSTL안녕==> ${i}</font>
			<br>
		</c:if>

		<c:if test="${stat.count%2 != 0 }">
			<font color="red">JSTL안녕==> ${i}</font>
			<br>
		</c:if>
	</c:forEach>

	<%
		//Controller에서 ArrayList로 저장된 데이터가 있다는 가정
		ArrayList<String> list = new ArrayList<>();
		list.add("나길동");
		list.add("차라임");
		list.add("정주원");
		list.add("김유신");

		request.setAttribute("nameList", list); //뷰(JSP)와 공유하기
		
		ArrayList<Person> list2 = new ArrayList<>();
		list2.add(new Person("나길동",13,"학생"));
		list2.add(new Person("나라임",14,"학생"));
		list2.add(new Person("너길동",16,"학생"));
		
		request.setAttribute("personList", list2);
	%>

	<h3>이름목록</h3>
	<hr>
	<ul>
		<c:forEach items="${nameList}" var="name"> 
			<li>${name }
		</c:forEach>
	</ul>
	
	<hr color="red">
	<h3>사람목록1(JSTL사용X)</h3>
	
	
	
	
	<hr color="red">
	<h3>사람목록2(JSTL사용O)</h3>
	<table border="1" cellpadding="5">
		<tr>
			<td>이름</td>
			<td>나이</td>
			<td>직업</td>
		</tr>
			<c:forEach items="${personList}" var="p">
			<tr>
				<td>${p.name }</td>
				<td>${p.age }</td>
				<td>${p.job }</td>
			</tr>
			</c:forEach>
			
		
		
		
	</table>
</body>
</html>



