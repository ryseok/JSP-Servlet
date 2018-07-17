<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--기존 HTML + java-->
<%--HTML통해 이 주석 확인 불가 !!!--%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>안녕 JSP</title>
</head>

	<body>
		<font color="blue" size="8">안녕 JSP</font>
		<script type="text/javascript">
		document.write("<br>hell JSP");
		</script>
		
		<% 
		System.out.println("hell world");
		%>
		
	</body>
</html>