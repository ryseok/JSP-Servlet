<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>application객체 테스트</title>
</head>
<%--application_test.jsp --%>
<body>
	<h3>application(ServletContext)객체 테스트</h3>
	<hr>
	1. 서블릿 컨테이너 이름:
	<%=application.getServerInfo()%>
	<br> 2. 서블릿 API버전:
	<%=application.getMajorVersion()%>.<%=application.getMinorVersion()%>
	<br> 3. 현재 Context(=현재 웹어플리케이션,제품,TomTest)의 실제경로(서버의 디스크경로):
	<%=application.getRealPath("")%>
	<br>
	<%
		//application.log("기록할 메시지");  ----> 필요한 정보 기록
		//문제) 어떤 사용자(ip)가 어떤 요청(get,post)을 했는지 파일로 기록하시오.
		String method = request.getMethod();//HTTP요청방식("GET","POST")
		String addr = request.getRemoteAddr();//접속클라이언트의 ip정보
		String protocol = request.getProtocol();//HTTP요청 버전: 1.0  1.1

		String info = "▶접속한 클라이언트 정보◀ protocol:" + protocol + ", 요청방식:" + method + ", 접속 IP:" + addr;
		System.out.println(info);//서버콘솔 출력!!
		out.print(info);//브라우저 출력!!
		application.log(info);//파일 출력!!
	%>

</body>
</html>







