<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록:입력폼</title>
</head>
<%--inputForm.jsp --%>
<body>
	<center>
		<h3>입력폼</h3>
		<hr>
		[<a href="/TomTest/guest/control">게시물 목록으로</a>]
		<br>
		<br>
		<form action="control?action=insert" method="post">
			<!--      <form action="/TomTest/guest/control?action=insert" method="post"> -->
			<table border="1" cellpadding="5">
			<tr>
				<td bgcolor="skyblue" width="80px">작성자</td>
				<td><input type="text" name="writer"></td>
			</tr>
			
			
			<tr>
				<td bgcolor="skyblue">email</td>
				<td><input type="text" name="email"></td>
			</tr>
				
				
			<tr>
				<td bgcolor="skyblue">전화번호</td>
				<td><input type="text" name="tel"></td>
			</tr>
				
				
			<tr>
				<td bgcolor="skyblue">비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
				
				
			<tr>
				<td colspan="2"><textarea rows="5" cols="35" name="contents"></textarea></td>
			</tr>
				
				
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="입력">
				<input type="reset" value="취소">
				</td>
			</tr>
			</table>
		</form>

<!--
기준
<form action="" method="post">
<input type="text" name="writer">
<input type="text" name="email">
<input type="text" name="tel">
<input type="password" name="pass">
<textarea rows="5" cols="30" name="contents"></textarea>
<input type="submit" value="입력">
<input type="reset" value="취소">
</form>
-->


	</center>
</body>
</html>



