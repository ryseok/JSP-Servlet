<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.Console"%>
<%@page import="com.encore.s0731.vo.EmpInfo"%>
<%@page import="java.util.List"%>
<%@page import="iba.MySqlMapClient"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--컨트롤로와 뷰 역활--%>
<table border="1" cellpadding="5">
	<tr>
		<th>사원번호</th>
		<th>사원명</th>
		<th>입사일</th>
		<th>부서명</th>
		<th>직책명</th>
	</tr>


<%
	String keyword = request.getParameter("keyword");
	String kindName = request.getParameter("kindName");
	SqlMapClient smc = MySqlMapClient.getSqlMapInstance();
	
/* 	List<EmpInfo> list = null;
	if(kindName.equals("ename")){
		list= smc.queryForList("emp.info1", "%"+keyword+"%");
		
	}else if(kindName.equals("dname")){
		list= smc.queryForList("emp.info2", "%"+keyword+"%");
		
	}else{
		list= smc.queryForList("emp.info3", "%"+keyword+"%");
		
	} */
	Map<String,String> map = new HashMap<>();
    map.put(kindName, "%"+keyword+"%");
  	List<EmpInfo> list = smc.queryForList("emp.info",map);
	
		for(EmpInfo info : list){
%>
<tr>
	<td><%=info.getEmpno() %></td>
	<td><%=info.getEname() %></td>
	<td><%=info.getHiredate() %></td>
	<td><%=info.getDname() %></td>
	<td><%=info.getJob() %></td>
</tr>

<%}%>
</table>