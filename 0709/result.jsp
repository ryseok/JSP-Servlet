<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>결과 : result.jsp</h3>
	<hr>
	<% request.setCharacterEncoding("UTF-8"); %>
	전달된 이름 :
	<%=request.getParameter("username")%>
	<br>
	<br> 전달된 세션 :
	<%=session.getAttribute("uname")%>
</body>
</html>