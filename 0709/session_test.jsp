<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세션테스트</title>
</head>
<%-- session_test.jsp --%>
<body>
	<h3>세션테스트</h3>
	<hr>
	<%--세션의 기본유지시간==> 1800초(30분)--%>
	<%
		//10초의 세션유지시간
		//session.setMaxInactiveInterval(10);
	
		if(session.isNew()){
			out.print("<script>alert('세션이 해제되어 다시 설정합니다.')</script>");
		}
	%>
	1. 세션ID(서버가 브라우저에게 부여하는 식별번호):
	<%= session.getId() %>
	<br>
	2. 세션유지시간:
	<%= session.getMaxInactiveInterval() %>초
</body>
</html>











