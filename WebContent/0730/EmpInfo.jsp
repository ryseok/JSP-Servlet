<%@page import="com.encore.s0730.vo.Emp"%>
<%@page import="java.util.List"%>
<%@page import="com.encore.s0727.dao.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ename = request.getParameter("searchEname");
	if (ename != null) {
		EmpDAO dao = new EmpDAO();
		List<Emp> list = dao.selectEmpInfo(ename);
		for (int i = 0; i < list.size(); i++) {
			Emp emp = list.get(i);
			out.print("<h3>" + emp.getEname() + "사원의 정보</h3><hr>");
			out.print("사원번호: " + emp.getEmpno());
			out.print("<br>사원명: " + emp.getEname());
			out.print("<br>입사일: " + emp.getHiredate());
			out.print("<br>부서명: " + emp.getDname());
		}
	}
%>
