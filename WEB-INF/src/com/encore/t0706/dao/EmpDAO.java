package com.encore.t0706.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.encore.db.MyDriverManager;
import com.encore.t0706.vo.Emp;

public class EmpDAO {//Data Access Object (DB전담 클래스)
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	/*
	DataSource ds;//커넥션 풀
	
	public EmpDAO() {
       //ds객체 생성!!
	   try {
		Context ctx = new InitialContext(); //객체 등록(이름설정과 함께 객체 등록),조회,수정,삭제
		   Context tomCtx = (Context) ctx.lookup("java:comp/env");//톰켓서버의 Context객체 조회
		   ds =  (DataSource) tomCtx.lookup("oracle/jdbc");
	   } catch (NamingException e) {
		e.printStackTrace();
	   }
	}*/
	
	private void connect() {//Connection객체생성
		//conn = ds.getConnection();//커넥션 풀로부터 사용하지 않는 Connection객체 한개 얻어오기
		conn = MyDriverManager.getConnection();
	}
	private void disconnect() {//Connection객체소멸 ----> 객체반환
		try {
			if(conn != null)conn.close();//커넥션 풀에 반환
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Emp> selectGradeInfo(){
		
	   ArrayList<Emp> list = new ArrayList<>();
	   try {
		connect();
		   String sql="select empno,ename,dname,grade "
		   		+ "from emp natural join dept inner join salgrade "
		   		+ "on sal between losal and hisal";
		   //select empno,ename,dname,grade from emp,dept,salgrade
		   //where sal between losal and hisal and emp.deptno=dept.deptno
		   
		   pstmt = conn.prepareStatement(sql);
		   rs = pstmt.executeQuery(); //rs <--- 14행 4열
		   
		   while(rs.next()) {//행얻기
			   //열(데이터)얻기
			  list.add(new Emp(rs.getInt("empno"),
			                   rs.getString("ename"),
			                   rs.getString("dname"),
			                   rs.getInt("grade")));
		   }
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
           disconnect();
	   }
       return list;
	}//selectGradeInfo
}






