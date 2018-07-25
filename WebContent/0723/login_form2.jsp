<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
	<h3>로그인폼2</h3>
	<!--if(session.getAttribute("user") != null)-->
	<logic:present scope="session" name="user">
	이미 로그인 상태 입니다.
	<br>
	사용자정보
	사용자명 : <bean:write name="user" property="name" scope="session"/> <br> 
	전화번호 : ${user.tel} <br>
	이메일 : ${sessionScope.user.email}
	</logic:present>
	<br>
	
	<!--if(session.getAttribute("user") == null)-->
	<logic:notPresent scope="session" name="user">
	<b>로그인 하세요.</b>
	</logic:notPresent>
	<hr>
	<form action="login2.do" method="post">
		<!--ActionMessage.GLOBAL_MESSAGE키로 저장된 메시지 있다면-->
		<html:messages message="true" id="msg">
		<font color="blue"> <b><bean:write name="msg"/></b> </font>
		</html:messages>
		<br>
		
		아이디
		<br>
		<input type="text" name="userid">
		
		<!--만약 액션폼에서 "errid" 키값으로 add된 메세지가 존재 한다면 그 값을 msg변수에 저장-->
		<!--<messages></messages> 시작 끝 태그 사이의 HTML코드를 출력 하시오.-->
		<html:messages property="errid" id="msg">
			<font color="red"><bean:write name="msg"/></font>
		</html:messages>
		<br><br>
		비밀번호
		<br>
		<input type="password" name="userpwd">
		<html:messages property="errpass" id="msg">
			<font color="red"><bean:write name="msg"/></font>
		</html:messages>
		<br><br>
		<button>로그인</button>
	</form>
</body>
</html>