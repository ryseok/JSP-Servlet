<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>사용자 인증</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.normal {
	font-family: "굴림", "돋움";
	font-size: x-small;
	font-style: normal;
	font-weight: normal;
	text-decoration: none
}

.normalbold {
	font-family: "굴림", "돋움";
	font-size: x-small;
	font-style: normal;
	font-weight: bold;
	text-decoration: none
}
</style>
</head>
<%-- sessionT2.jsp --%>
<%
	/*
	   폼에 입력된 아이디와 비밀번호를 검사(인증)!!
	       ----> DB비교
	       ----> 일치(id존재, pass일치)경우: 밑의 HTML출력
	       ----> 불일치경우: 로그인페이지로 이동
	*/

	HashMap<String, String> map = new HashMap<>(); //map == DataBase
	//key:아이디, value:패스워드
	//데이터 저장!!  
	map.put("gildong", "1234");
	map.put("lime", "5678");
	map.put("juwon", "1256");


	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	//데이터 조회  : map.get(Object key)
	//id="gildong"   map.get("gildong") map.get(id)
	String dpass = map.get(id);
	if (dpass != null) {//아이디 존재 O

		if (dpass.equals(pass)) {//아이디 존재O, 비번일치
			//세션에 로그인 성공을 저장!!
			session.setAttribute("login", "success");

		} else {//아이디 존재O, 비번 불일치
			response.sendRedirect("sessionT1.jsp");
		}

	} else {//맵에 키가 존재하지 않는다면 ==> 아이디 존재 X
		response.sendRedirect("sessionT1.jsp");
	}

	/*
	    a.jsp
	  <form action=b.jsp>
	     <input name="id">
	     <input name="pwd">
	  </form>
	
	    b.jsp
	  String id = request.getParameter("id");   //폼 입력값 저장  
	  String pwd = request.getParameter("pwd");  //폼 입력값 저장 
	  String name = request.getParameter("name");  //에러발생? X   name=null;
	 name.equals(); //에러발생O
	  String gildong = request.getParameter("gildong");//에러발생? X   gildong=null;
	  -------------------------------------------------------------------
	  
	  <conn.properties>
	  driver=.....
	  url=....
	  user=....
	  password=....
	  
	  Properties pro = 파일 로드;
	      String driver = pro.getProperty("driver"); // OracleDriver리턴
	      String user = pro.getProperty("user"); // scott리턴
	      String pwd = pro.getProperty("pwd"); // 에러발생?X   pwd=null;
	  -------------------------------------------------------------------
	  map.put("gildong","1234");     
	  map.put("lime","5678");     
	  map.put("juwon","1256");  
	  
	  
	  String str1 = map.get("gildong"); // str1===> "1234"
	  String str2 = map.get("yoosin"); // str2 ===> null
	    
	
	
	*/
%>
<body>
	<center>
		<p class="normalbold">사용자 인증 완료</p>
		<p class="normal">
			<a href="sessionT3.jsp">서비스페이지</a>
		</p>
	</center>
</body>
</html>
