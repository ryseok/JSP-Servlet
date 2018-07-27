<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String title[]={"이해찬·김진표·송영길, 민주당 당대표 예비경선 통과",
					"농림축산식품부 장관에 이개호…文정부 2기 내각 첫인선",
					"양승태 행정처, '변호사 성공보수' 대법원 선고 개입 정황",
					"삼성생명, 즉시연금 금감원안 부결…예시금액만 지급 결의"};
	
	for(int i=0; i<title.length; i++){
		if(i==0){
			out.print("<strong><a href=https://news.naver.com/ >"+title[i]+"<br>"+"</a></strong>");
		}else{
			out.print(title[i]+"<br>");
		}
	}
%>