<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>입력값 출력</title>
	</head>

	<body>
   		<h3>폼에 입력된 값을 출력</h3>
  		<!--request.getParameter은 login_form.html 결과값에서 요청 한것!!!--> 
   		아이디: <%= request.getParameter("id") %> <br>
   		비번:  <%= request.getParameter("pwd") %>
	</body>
</html>