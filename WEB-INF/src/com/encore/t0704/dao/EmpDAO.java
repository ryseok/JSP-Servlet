package com.encore.t0704.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.encore.t0704.vo.Emp;

public class EmpDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	Properties pro;
	
	public EmpDAO(String path) {
	    try {
			//DB연결정보  ---> conn/conn.properties
			pro = new Properties();
			//파일읽기 기본!! ---> 전체경로를 전부 써주자!!
			//pro.load(new FileReader("conn/conn.properties"));		
			//pro.load(new FileReader("C:/rys/workspace/TomTest/conn/conn.properties"));		
			pro.load(new FileReader(path+"conn/conn.properties"));		
			Class.forName(pro.getProperty("driver"));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}//생성자
	
	
	public ArrayList<Emp> findAll() {
	   ArrayList<Emp> list = new ArrayList<>();
	   try {
		connect();	
		   String sql="select empno,ename,hiredate,sal,dname "
		   		      + "from emp natural join dept";
		   //----> 결과데이터: 14행 5열
		   pstmt = conn.prepareStatement(sql);//sql문을 전달
		   
		   rs = pstmt.executeQuery();//sql문 실행 요청
		   
		   while(rs.next()) {//한 행얻기, 얻은 행이 있다면
			   list.add(
			             new Emp( 
							    rs.getInt("empno"),//행안의 특정 데이터 얻기   
							    rs.getString("ename"),   
							    rs.getDate("hiredate"),   
							    rs.getInt("sal"),   
							    rs.getString("dname") 
							    )
			            );   
		   }
	   } catch (SQLException e) {
		    e.printStackTrace();
	   } finally {
	      disconnect();
	   }
	   
	   
	   /*
	        int    empno=      7788;
	        String ename=     "SCOTT";
	        Date   hiredate=  '1990-05-03';
	        int    sal=        3000;
	        String dname=      "RESEARCH";
	        
	        5개의 변수 ---한개의 변수명으로 정의--->  Emp emp = new Emp();
	        
	        --------------------------------------------------------
	        Emp emp1 = new Emp();  <== SCOTT사원의 정보 
	        Emp emp2 = new Emp();  <== ADAMS사원의 정보
	        Emp emp3 = new Emp();  <== KING사원의 정보
	        Emp emp4 = new Emp();  <== SMITH사원의 정보
	           ..... emp14
	           
	   14개의 변수 ---한개의 변수명으로 정의---> ArrayList<Emp> list = new ArrayList();   
	    */
	   
	   return list;
	}//findAll
	
	private void connect() {
	   try {
		conn = DriverManager.getConnection(pro.getProperty("url"),pro);
	   } catch (SQLException e) {
		e.printStackTrace();
	  }	
	}
	private void disconnect() {
		try {
			if(conn != null)conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
}