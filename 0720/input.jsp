<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>0720</title>
</head>
<body>
	<center>
	<h3>입력폼</h3>
	<hr>
	<form action="result.jsp" method="post">
		이름 : <input type="text" name="username">
		<br>
		<input type="submit" value="전송">
	</form>
	<br>
	책정보 : ${book}
	<br>
	ServletContext에 저장된 common 출력 :
	<%= application.getInitParameter("common")%>
	<br>
	<img src="/TomTest/image/wedding.jpg" width="300" height="300">
	<br><br>
	<img  src="${initParam.imgPath}/wedding.jpg" width="300" height="300">
	</center>
</body>
</html>