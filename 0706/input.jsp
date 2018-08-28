<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--input.jsp-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>입력 페이지</title>
</head>
<body>
	<h3>input.jsp(페이지입력)</h3>
	<hr>
	 <%-- <form>정의 == <form action="input.jsp" method="get"> --%>
	 <form action="print.jsp" method="post" >   
          
     <%-- <input>  == <input type=text> --%>     
          나이: <input type="text" name="age">
          <br> 
          이름: <input type="text" name="username">
          <br>
     
     <%-- <button> == <button type=submit> --%>
     <button>전송</button> 
   </form>
</body>
</html>