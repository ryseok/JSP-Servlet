<%@page import="com.encore.t0703.Calculator"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>계산결과.jsp</title>
	</head>


	<body>
		<% 
		//request : 요청 ===> calc.jsp요청
		String su1 = request.getParameter("su1"); //계산할 숫자 입력
		String su2 = request.getParameter("su2"); //계산할 숫자 입력
		String oper = request.getParameter("oper"); //사칙연산 선택

		//2. 계산실행
		//.java에 있는 것을 호출 할때  page import="com.encore.t0703.Calculator" 해야함.
		//ctrl +space 하면 이클립스가 알아서 생성!!! 개꿀!!!
		//Integer.parseInt : String ==변환==> int
		Calculator calc = new Calculator(Integer.parseInt(su1),
		                          		Integer.parseInt(su2),
		                          		oper);
		//3. 계산결과값 얻기
		//com.encore.t0703.Calculator에 있는 
		//getResultStr() 메소드 호출 
		String result = calc.getResultStr();
		%>
		
		<%= 
		//4. 계산값을 화면에 출력
		result
		%>
	</body>
</html>