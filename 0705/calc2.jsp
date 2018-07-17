<%@page import="com.encore.t0703.Calculator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title>계산기.jsp</title>
		</head>

	<body>
		<center>
		<h2>calc.jsp + result.jsp</h2>
   			<h3>계산기</h3>
   			<hr>
   		<form action="calc2.jsp" method="post">
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

   		
   		<% 
   		String method = request.getMethod();
		if(method.equals("POST")){
   		out.print("<hr>"); //계산버튼 클릭시 계산폼 밑으로 수평선<hr> 긋기
   		
   		//1. 요청
		String su1 = request.getParameter("su1"); //계산할 숫자 입력
		String su2 = request.getParameter("su2"); //계산할 숫자 입력
		String oper = request.getParameter("oper"); //사칙연산 선택

		//만약 su1 또는 su2에 데이터가 입력되지 않았다면 '빨강색'으로 "데이터를 입력!!" 출력
		if(su1.trim().length()==0 || su2.length()<1){
			out.print("<font color='red'>데이터를 입력하시오!!!</font>" );
		}
		//만약 su1 또는 su2에 숫자아닌값이 입력되었다면 '빨강색'으로 "숫자만 입력!!" 출력
		else if(!su1.matches("[0-9]+") || !su2.matches("[\\d]+") ){
			out.print("<font color='red'>숫자만 입력하시오!!!</font>" );
		}
		//만약 oper가 '/'이고 su2가 '0'이 입력되었다면 '빨강색'으로 "0으로 나눌 수 없습니다!!" 출력
		else if(oper.equals("/") &&  su2.equals("0")){
			out.print("<font color=red>0으로 나눌수 없습니다!!!</font>");
		}else{
		//2. 계산실행
		//에러 발생 ===> java.lang.NumberFormatException: null
		//해결 책 : if 사용하자
		//if(su1 != null){
		Calculator calc = new Calculator(Integer.parseInt(su1),
		                          		 Integer.parseInt(su2),
		                          		 oper);
		
		
		
		//3. 계산결과값 얻기 + 계산값을 화면에 출력
		//수평선 밑에 계산 결과를  '파랑색'으로  "결과값: 2*3=6" 출력
		out.print("<font color='blue'>" + calc.getResultStr() + "</font>");
		}//if(su1.trim().length()==0 || su2.length()<1) End
		
		}//if(method.equals("POST")) End
		
		%>
		</center>
	</body>
</html>