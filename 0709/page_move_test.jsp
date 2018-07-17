<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>페이지 이동 테스트</title>
</head>
<%--page_move_test.jsp --%>
<body>
	<h3>★페이지 이동 테스트★</h3>
	<hr>

	<%--<form>은 버튼,체크콤보,라디오등등 만들때 사용!!!--%>
	<form method="post" action="redirect_move.jsp">
		이름 : <input type="text" name="username">
		<br> 
		<input type="submit" value="페이지이동(리다이렉트)">
	</form>
	<hr>
	<form method="post" action="forward_move.jsp">
		이름 : <input type="text" name="username"> 
		<br> 
		<input type="submit" value="페이지이동(포워드)">
	</form>
</body>
</html>


