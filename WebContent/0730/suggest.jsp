<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- suggest.jsp(Ajax요청에 대한 (HTML)응답페이지) --%>
<%!String []keywords={"자바","자바라","자바캔","자라","자바프로그래밍",
    		 "자석","자소서","자기소개서","자동차","자연휴양림",
    		 "apple","ajax","aoa","abc마트","aj렌트카","apartment",
    		 "axa다이렉트","a3논란","apple_store"};

     public List<String> search(String keyword){
    	List<String> resultList = new ArrayList<>();
    	
    	//사용자가 입력한 데이터(keyword)를 배열과 비교해서 keyword로 시작하는 단어만 
    	//resultList에 추가!!
    	
    	// "javaProgramming".startsWith("ja") ---> "ja"로 시작하면 true
    	// "javaProgramming".startsWith("ing") --->  false
    	// "javaProgramming".endsWith("ing") --->  true
    	// "javaProgramming".contains("Pro") --->  true
    	if(keyword==null || keyword.equals("")){
    		return resultList; //size가 0인 List리턴
    	}
    	
    	for(int i=0; i<keywords.length; i++){
    	    if(keywords[i].startsWith(keyword)){
    	    	resultList.add(keywords[i]);
    	    }
    	}
    	
    	return resultList;
     }//search
     %>

  <%
      String keyword = request.getParameter("keyword");
  	  //System.out.println("keyword===>"+keyword);
  	  
      List<String> list = search(keyword);
      out.print(list.size()+"|");
      for(int i=0; i<list.size(); i++){
    	  out.print(list.get(i));
    	  if(i<list.size()-1){
    		  out.print(",");
    	  }
      }
  %>
