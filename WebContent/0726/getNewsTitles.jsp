<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		String titles[] = { "주중 미국대사관 부근서 폭발의심 사고 발생",
						   "일본 홋카이도 공해상 우리 원양어선끼리 충돌…1척 침몰",
						   "주행 중 엔진서 불난 BMW, 10만6000대 자발적 리콜" };
		
		out.print("<ul>");
		for(int i=0; i<titles.length; i++){
			if(i==0){
				out.print("<li><strong>"+titles[i]+"</strong></li>");
			}else{
				out.print("<li>"+titles[i]+"</li>");
			}
		}//if_End
		out.print("</ul>");
	%>