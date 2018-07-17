<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파라미터 데이터출력</title>
</head>
<%--print.jsp --%>
<body>
  <h3>파라미터(전달된) 데이터출력</h3>
  <hr>
  <%request.setCharacterEncoding("UTF-8"); %>
    이름:<%= request.getParameter("username") %><br>
    나이:<%= request.getParameter("age") %><br>
    아무거나:<%= request.getParameter("any") %><br>
  <hr color="blue">
  이름: ${param.username } <br>
  나이: ${param.age } <br>
  아무거나: ${param.any }
  
  <%-- 
  ${a }    ----> a키값이 담은 데이터를 바로 출력 
  
  ${a.b }  ----> a키에 저장된 값은 반드시 클래스여야만 함!!
                 만약  A클래스가 저장되어 있다면   A클래스내의 getB()메소드의 리턴값을 얻어와서 화면에 출력. --%>

</body>
</html>



