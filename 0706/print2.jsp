<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>전달 파라미터 ===> 출력</title>
	</head>

	<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	이름: <%= request.getParameter("uname") %>
	<br>
	비번: <%= request.getParameter("pass") %>
	<br>
	히든: <%= request.getParameter("hide") %>
	<br>
	좋아하는 과일:
	<%
		//여러개의 name 얻어올때
		String[] fruits = request.getParameterValues("fruit");
		if(fruits != null){
		for(int i=0; i<fruits.length; i++){
			out.print(fruits[i]+" ");
			}
		}//if End
	%>
	<br>
	강의실:	<%= request.getParameter("room") %>
	<br>
	점심메뉴:	<%= request.getParameter("menu") %>
	<br>
	메모:	 	<%= request.getParameter("memo") %>
	<br><hr>
	<%
		//만약에 폼안의 name속성 값을 모를 경우
		Enumeration<String> names = request.getParameterNames();
		while(names.hasMoreElements() ){
			String name = names.nextElement();
			out.print(name + ":" + request.getParameter(name)+"<br>" );
		}
	%>	
	</body>
</html>