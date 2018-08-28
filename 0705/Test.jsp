<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
톰캣 실행후 
JSP 작성 하면 알아서 서블릿 생성!!!!
단, 서블릿 분석은 할줄 알아야함.
--%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<%! int cnt; %>
		<%! String str; 
			
			//메소드 생성 비권장!!!
			String getMsg(){
				return "썰전 하는날";
			} 
		
		%>
	</head>


	<body>
		<h3>JSP Test</h3>
		<hr>
		<%
			cnt++;
			request.getParameter("id");
        	str = getMsg();
			out.print("<br>cnt="+cnt);
		%>
		<br>STR=<%= str %>
	</body>
</html>