<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- JSP1.2방식 --%>    
<%@taglib uri="/WEB-INF/tld/MyTag.tld"  prefix="my"%>   

<%-- JSP2.0방식 --%>
<%@taglib tagdir="/WEB-INF/tags" prefix="you"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커스텀태그</title>
</head>
<%--customTag_test.jsp --%>
<body>
  <h3>커스텀태그 테스트</h3>
  <hr>
  <my:gildong/>
  <hr color="orange">
  <my:lime/>
  <hr color="green">
  <you:juwon border="10" color="skyblue" >상품목록</you:juwon>
</body>
</html>




