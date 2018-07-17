<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--include.jsp-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>include</title>
</head>
<body>
	<h3>include_action.jsp</h3>
	<hr>
	<jsp:include page="session/sessionT1.jsp"></jsp:include>
	<hr color="red">
	<%@include file="login.jsp"%>
</body>
</html>