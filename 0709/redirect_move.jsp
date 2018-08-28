<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%--redirect_move.jsp --%>
<body>
	<h3>redirect_move.jsp</h3>
	<%
		request.setCharacterEncoding("UTF-8");
		response.sendRedirect("result.jsp");
		
		session.setAttribute("uname", request.getParameter("username"));
	%>

</body>
</html>