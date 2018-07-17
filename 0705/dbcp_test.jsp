<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>커넥션 풀 테스트</title>
	</head>


	<body>
		<h3>DBCP 테스트</h3>
		<hr>
		<h3>사원이름 검색</h3>
		<form method="post">
			사번 : <input type="text" name="empno">
			<input type="submit" value="검색">
		</form>
		<%
			/*
			<객체등록, 조회, 삭제 : Context>
			<객체등록>
			ctx.bind("이름", 객체);
			ctx.rebind("이름", 객체);
			
			<객체조회>
			ctx.lookup("이름");
			
			<객체삭제>
			ctx.unbind("이름");
			*/
	
			if(request.getMethod().equals("POST")){//"GET" "POST"
		         //검색버튼을 클릭했을때
		         
		         Context ctx = new InitialContext();
		         
		         //톰켓서버의 Context객체 얻어오기
		         Context tomCtx = (Context)ctx.lookup("java:comp/env");
		         //자식            (자식)부모
		         
		         DataSource ds = (DataSource)tomCtx.lookup("oracle/jdbc");
		         //ds == 커넥션풀!!
		               
		         Connection conn = ds.getConnection();
		         //커넥션풀내의 미리 생성(준비)된 Connection 요청(주소 얻어오기)
		         
		         //out.print("DB연결 성공!!");
		         String empno = request.getParameter("empno");
		         
		         String sql = "select ename from emp where empno=?";
		         PreparedStatement pstmt = conn.prepareStatement(sql);
		         //pstmt.setInt(물음표순서, 전달데이터);
		         pstmt.setInt(1, Integer.parseInt(empno));
		         ResultSet rs = pstmt.executeQuery();//sql문 실행 요청
		         
		         if(rs.next()){//사번이 일치하는 사원명을 찾았다면
		            out.print(empno+"사번은["+rs.getString("ename")+"]사원입니다!!");
		            
		         }else{
		            out.print(empno+"사번이 존재하지 않습니다!!");
		         }
		         
		         //7788사번은 [SCOTT]사원입니다!!
		      }
		%>
	</body>
</html>