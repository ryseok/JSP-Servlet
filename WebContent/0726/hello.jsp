<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% System.out.println("hello.jsp 요청"); %>
<font color="red">hello Ajax</font>
<br>
<%request.setCharacterEncoding("UTF-8"); %>
<%=request.getParameter("a") %>
<br>
안녕,<%=request.getParameter("name") %>
