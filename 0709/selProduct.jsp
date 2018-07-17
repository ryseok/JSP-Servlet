<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품목록</title>
</head>
<%--selProduct.jsp(상품목록) --%>
<body>
	<center>
		<h3>상품목록</h3>
		<hr>
		<%
			request.setCharacterEncoding("UTF-8");
				
			//이름: <input type="text" name="username" size="10">
			//에서 요청하는 username 가져오기
			String userName = request.getParameter("username");

			//userName을 세션에 저장하기!! ===> session.setAttribute();
			//왜? 로그인폼에서 (입력)전달된 값이 같은 브라우저에 유지하기 위해!!
			if (userName != null) { //로그인폼을 통해 username을 전달 받았을때    		  
				session.setAttribute("loginName", userName);
				

			}
				ArrayList<String> list = (ArrayList<String>)session.getAttribute("fruitsName");
				
				if(list != null){
					list.clear(); //장바구니 비우기
					
				}
		%>
		<!--     [홍길동]님이 로그인한 상태입니다.<br><br> -->
		<%--     [<%= userName %>]님이 로그인한 상태입니다.<br><br> --%>
		
		<!--세션에 저장한 속성값 읽기 session.getAttribute()-->
		[<%=session.getAttribute("loginName")%>]님이 로그인한 상태입니다.
		<br>
		<br>
		<form action="add.jsp" method="post">
			<select name="product">
				<option>사과</option>
				<option>수박</option>
				<option>딸기</option>
				<option>파인애플</option>
				<option>바나나</option>
			</select>
			<button>추가</button>
		</form>
		<br>
		<br>
		<a href="checkOut.jsp">장바구니 보기</a>
	</center>
</body>
</html>



