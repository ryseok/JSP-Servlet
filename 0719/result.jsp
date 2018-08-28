<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결과페이지</title>
</head>
<body>
	<h3>결과페이지</h3>
	<hr>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	이름 : <%=request.getParameter("username")%>
	<br>
	파일 : <%=request.getParameter("myfile")%>
	<hr color="red">
	<%
		ServletInputStream sis = request.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(sis, "UTF-8"));
		String delimiter = br.readLine(); //구분자 문자열
		String str;
		while ((str = br.readLine()) != null) {
			out.print(str + "<br>"); //웹브라우저에 출력
			if (str.contains("name=\"username\"")) {
				System.out.println("이름을 찾았다");
				br.readLine(); //한줄 skip
				String name = br.readLine();
				out.print("당신의 이름은 ===>" + name);
			}
			if (str.contains("name=\"myfile\"")) {
				br.readLine(); //두줄 skip
				br.readLine(); //두줄 skip

				//파일명 구하기 ===> sample.txt
				int idx = str.lastIndexOf("=");
				String fileName = str.substring(idx + 2, str.length() - 1);

				OutputStreamWriter osw = new OutputStreamWriter(
						new FileOutputStream(application.getRealPath("/upload/") + fileName));
				String content;
				while (!(content = br.readLine()).contains(delimiter)) { //파일안의 내용일기
					osw.write(content + "\r\n");
				}
				osw.close();
				out.print("<br>파일업로드성공");
			}

		} //while
	%>
</body>
</html>