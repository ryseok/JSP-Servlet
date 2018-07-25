<%@page import="com.encore.s0724.model.Calculator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title>계산기</title>
		</head>

	<body>
		<center>
		<h2>Struts 계산기</h2>
   		<hr>
   		<form action="calc.do" method="post">
      		<input name="su1" type="text" size="4">
      		<select name=oper>
      		<option>+</option>
      		<option>-</option>
      		<option>*</option>
      		<option>/</option>
      		</select>
     		<input name="su2" type="text" size="4" >
      		<input type="submit" value="계산">
   		</form>
		<hr>
   		<html:messages id="msg" property="errCalc">
   			<font color="red"><bean:write name="msg"/></font>
   		</html:messages>
   		<font color="blue">${result}</font> 
		</center>
	</body>
</html>