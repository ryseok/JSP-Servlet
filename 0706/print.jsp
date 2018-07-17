<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전달데이터 출력</title>
</head>
<%--print.jsp --%>
<body>
	<h3>전달 파라미터 출력</h3>
	<hr>
	<!-- 
	이렇게 해도됨....
	String age = request.getParameter("age");
	<%-- <%=age %> --%>
	-->
	
	
	<%--
         매번 할때마다 작성... 흠...
     request를 통한 전달된 한글에 대한 처리 (한글 깨짐 방지)
     request.setCharacterEncoding("UTF-8");
	  
	  ※주의사항
	 1. 어떤 request.getParameter(""); 보다 먼저 설정 
	 2. 전달받는 방식은 POST인 것이 좋다
	 3. requset(HTML) 정의된 문자집합에 일치하는(setCharacterEncoding) 설정 해야됨
		즉, 받는 곳과 보내는 곳이 같아야 한다.
	 --%>
	<% request.setCharacterEncoding("UTF-8"); %>
	나이:<%= request.getParameter("age") %>세
	<br>
	이름: <%= request.getParameter("username") %>
</body>
</html>


