<%@page import="com.encore.s0730.vo.Emp"%>
<%@page import="com.encore.s0727.dao.EmpDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="iba.MySqlMapClient"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	SqlMapClient smc = MySqlMapClient.getSqlMapInstance();//sql호출할 준비

	String action = request.getParameter("action");
	//System.out.println("action=" + action); //Test

	List<String> list = null;
	if (action == null || action.equals("sido")) {
		list = smc.queryForList("addr.sido");
		//for(int i=0; i<list.size(); i++){ String str = list.get(i);}
		//for(자료형 변수명:배열또는리스트 ){//개선된 for루프(JDK5이후)
	} else if (action.equals("gugun")) {
		String sido = request.getParameter("sido");
		list = smc.queryForList("addr.gugun", sido);
	}else if(action.equals("dong")){
		 Map<String,String> map = new HashMap<>();	
  	   map.put("sido", request.getParameter("sido"));
  	   map.put("gugun", request.getParameter("gugun"));
  	list = smc.queryForList("addr.dong", map);
	}

		out.print("<option  value='0'>==선택==</option>");
	for (String str : list) {
		out.print("<option value='" + str + "'>" + str + "</option>");
	}
	
	


%>
