<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품추가</title>
</head>
<%-- add.jsp --%>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		/*<select name="product"> 클릭한것을 가지고 온다*/
		String productName = request.getParameter("product");

		//세션에 과일명을 저장!!
		ArrayList<String> list = (ArrayList<String>) session.getAttribute("fruitsName");

		if (list == null) {           //처음 장바구니를 사용한다면(add.jsp를 처음 호출했다면)
			list = new ArrayList<>(); //새로운 장바구니를 생성!!
		}

		list.add(productName);

		//String productName: 한개의 과일명 저장
		//ArrayList list: 여러개의 과일명 저장
		session.setAttribute("fruitsName", list);

		/*      out.print("<script>alert('딸기(이)가 추가되었습니다!!');history.back()</script>"); */
		out.print("<script>alert('" + productName + "(이)가 추가되었습니다!!');history.back()</script>");
	%>
</body>
</html>





