<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인폼</title>
</head>
<%-- login.jsp --%>
<body>
	<center>
		<h3>로그인화면</h3>
		<hr>
		<form name="login_frm" action="selProduct.jsp" method="post">
			이름: <input type="text" name="username" size="10">
			<br>
			<input name="login_bt" type="submit" value="로그인">
		</form>
	</center>
</body>
</html>


