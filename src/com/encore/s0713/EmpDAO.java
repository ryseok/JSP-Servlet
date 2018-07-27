package com.encore.s0713;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmpDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public EmpDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
	}//������
	
    private void connect() {
       try {
		conn = DriverManager.getConnection
					("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
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
