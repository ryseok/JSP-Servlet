package com.encore.db;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MyDriverManager {// 커넥션풀로 부터 Connection얻어오기

	public static Connection getConnection() {
		Connection conn = null;
		try {
			// 객체 등록(이름설정과 함께 객체 등록),조회,수정,삭제
			Context ctx = new InitialContext();
			
			// 톰켓서버의 Context객체 조회
			Context tomCtx = (Context) ctx.lookup("java:comp/env"); 
			DataSource ds = (DataSource) tomCtx.lookup("oracle/jdbc");
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}// Connection End
} // class End