package com.encore.t0713;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.encore.db.MyDriverManager;
import com.encore.t0713.Emp;

public class EmpDAO3 {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//DBCP 사용
	//DataSource ds; //커넥션 풀
	
	public EmpDAO3() {
		
	}//������
	
    private void connect() {
    	conn = MyDriverManager.getConnection();
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
