<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%-- start.jsp (영역객체, 영역데이터 테스트) --%>
<body>
	<%
		//데이터를 영역(page,request,session,application)에 저장
		String name = "홍길동";
		pageContext.setAttribute("k1", name); 			//현재 페이지에서만 공유
		request.setAttribute("k2", "길라임");  			//요청관계에 있는 페이지간 공유
		session.setAttribute("k3", "김주원");           	//동일 브라우저(동일접속)내에서 공유
		application.setAttribute("k4", "즐거운 월요일 :)");	//동일 서버(TomCat)에서의 공유
		application.setAttribute("k3", "이순신");        	//동일 서버(TomCat)에서의 공유
		
		//페이지이동
		RequestDispatcher rd =  request.getRequestDispatcher("/0709/end.jsp");
		rd.forward(request, response);
	%>
</body>
</html>


