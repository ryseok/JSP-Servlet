<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.OracleDriver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원정보</title>
</head>
<body>
<%
//jsp 페이지내에서 JDBC를 직접 사용
//1.드라이버 로딩(제품군 선택)
Class.forName("oracle.jdbc.driver.OracleDriver");

//2.DB연결
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");

//3.SQL실행 Statement stmt
//PreparedStatment pstmt : 속도, 보안(SQL Injection 예방)
String sql = "select empno,ename,hiredate from emp";
Statement stmt =  conn.createStatement();
stmt.executeQuery(sql);

PreparedStatement pstmt = conn.prepareStatement(sql);
//바인딩변수(?)에 대한 초기화 : 예) pstmt.setString(1,"홍길동");

//4. SQL실행(조회) 결과 얻어오기
ResultSet rs = pstmt.executeQuery(); //sql문 실행요청 ===> 실행시점
//rs는 행과열로 구성된 [데이터 덩어리]
%>

<center>
<h3>사원정보출력</h3>
<hr>
<table>
<tr>
<th>사원번호</th> <th>사원명</th> <th>입사일</th>
</tr>

 <%  while(rs.next()){//rs는 if(결과행이 0,1예상) , while(결과행이 2이상)과 친하다%>  
      <tr>
         <td><%=rs.getInt("empno") %></td>
         <td><%=rs.getString("ename") %></td>
         <td><%=rs.getDate("hiredate") %></td>
      </tr>
    <%   }%>
</table>
</center>
</body>
</html>