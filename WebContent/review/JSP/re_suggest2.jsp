<%@page import="com.encore.s0727.dao.EmpDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- suggest.jsp(Ajax요청에 대한 (HTML)응답페이지) --%>
<%
String keyword = request.getParameter("keyword");
EmpDAO dao = new EmpDAO();
List<String> list = dao.selectKeyword(keyword+"%");
  	  //System.out.println("keyword===>"+keyword);
      out.print(list.size()+"|");
      for(int i=0; i<list.size(); i++){
    	  out.print(list.get(i));
    	  if(i<list.size()-1){
    		  out.print(",");
    	  }
      }
%>
