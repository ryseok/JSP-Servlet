<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
	<h3>로그인폼</h3>
	<hr>
	<form action="review.do" method="post">
		아이디 : 
		<br>
		<input type="text" name="userid">
		<br>
		비밀번호 : 
		<br>
		<input type="password" name="userpwd">
		<br><br>
		<button>로그인</button>
	</form>
</body>
</html>