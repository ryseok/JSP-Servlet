<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록:리스트</title>
</head>
<%--list.jsp --%>
<body>
	<center>
		<h3>방명록:리스트</h3>
		<hr>
		<a href="/TomTest/guest/control?action=form">방명록 쓰기</a>
		<br>
		<br>
		<table border="1" cellpadding="5">
			<tr bgcolor="skyblue">
				<th>번호</th>
				<th>작성자</th>
				<th>전화번호</th>
				<th>작성일</th>
				<th>내용</th>
			</tr>
			<c:forEach items="${list }" var="guest">
				<tr>
					<td>${guest.no }</td>
					<td>${guest.writer }</td>
					<td>${guest.tel }</td>
					<td><fmt:formatDate value="${guest.wdate }" pattern="yyyy-MM-dd" /></td>
					<td><a href="/TomTest/guest/control?action=edit&no=${guest.no }">${guest.contents }</a></td>
				</tr>
			</c:forEach>
		</table>
	</center>
</body>
</html>


