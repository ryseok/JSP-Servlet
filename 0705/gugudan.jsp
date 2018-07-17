<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
스스로 해결 클리어
out.print("HTML 태그 또는 출력 하고 싶은거 작성해도 됨!!!");
--%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>구구단.jsp</title>
	</head>

	
	<body>
		<h2>구구단</h2>
		<hr>
		<table cellpadding=5 border="1" bordercolor="blue">
		<% 
			for(int i=1; i<10; i++){
				out.print("<tr>");
				for(int j=2; j<10; j++){
					out.print("<td>" + j + "*" + i + "=" + j*i + "</td>");
				}
				out.print("</tr>");
			}
		%>
		</table>
	</body>
</html>