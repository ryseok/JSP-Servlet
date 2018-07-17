package com.encore.t0713;

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

public class EmpDAO2 {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	Properties pro;
	
	public EmpDAO2(String contextPath) {
		try {
			pro = new Properties();
			pro.load(new FileReader(contextPath+"conn/conn.properties"));//특정파일의 속성데이터를 적재
			Class.forName(pro.getProperty("driver"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}//������
	
    private void connect() {
       try {
		conn = DriverManager.getConnection
					(pro.getProperty("url"),pro);
	  } catch (SQLException e) {
		e.printStackTrace();
	  }
    }//connect 
    private void disconnect() {
    	try {
			if(conn != null)conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }//disconnect 
    
    public ArrayList<Emp> selectAll() {
     ArrayList<Emp> list = new ArrayList<>();
    	try {
			connect();
    		String sql="select empno,ename,hiredate from emp";
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Emp(
						rs.getInt("empno"),
						rs.getString("ename"),
						rs.getDate("hiredate") ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return list;
    }//selectAll
        
}
