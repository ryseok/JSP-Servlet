<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니 결과화면</title>
</head>
<%--checkOut.jsp --%>
<body>
	<center>
		<h3>선택된 상품목록</h3>
		<hr>
    <%
       ArrayList<String> list = (ArrayList<String>)session.getAttribute("fruitsName");
    
       for(int i=0; i<list.size(); i++){
    	   out.print(list.get(i)+"<br>");
       }
    //사과:100원, 수박:200원, 딸기:300원, 파인애플:400원, 바나나:500원
    %>
		<hr>
		총합계: 600원 <br> <input type="button" value="장바구니 비우기(결제)" onclick="location.href='selProduct.jsp'">
	</center>
</body>
</html>


