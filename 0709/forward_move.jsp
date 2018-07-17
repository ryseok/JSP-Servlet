<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%--forward_move.jsp --%>
<body>
	<h3>forward_move.jsp</h3>
	<%
		RequestDispatcher dispatcher //이동할 페이지의 정보 담기
				= request.getRequestDispatcher("/0709/result.jsp");

		dispatcher.forward(request, response);//실제이동명력
		//현재 request객체(정보)를 result.jsp에게 전달
	%>

</body>
</html>