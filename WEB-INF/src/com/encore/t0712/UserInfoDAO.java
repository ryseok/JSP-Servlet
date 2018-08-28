package com.encore.t0712;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.encore.db.MyDriverManager;


public class UserInfoDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	


	
	
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
	
	
	public boolean insert(UserInfo user){
		
	   

		   try {
			connect();
//				String sql = "insert into userinfo(id) "
//						+ "values (?)"; 
				String sql = "insert into userinfo(id,pass,name,jumin,birth,zip,addr,email,job) "
						+ "values (?,?,?,?,?,?,?,?,?)"; 
			   
			   pstmt = conn.prepareStatement(sql);
		
			   pstmt.setString(1, user.getId() );
			   pstmt.setInt(2, user.getPass() );
			   pstmt.setString(3, user.getName() );
			   pstmt.setInt(4, user.getJumin() );
			   pstmt.setInt(5, user.getBirth() );
			   pstmt.setString(6, user.getZip());
			   pstmt.setString(7, user.getAddr());
			   pstmt.setString(8, user.getEmail());
			   pstmt.setString(9, user.getJob());
			   
			   pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disconnect();
			
		}
		return false;
		
			                   	  
			  
	
	   
      
	}//selectGradeInfo
}
