package com.encore.guest.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import com.encore.guest.vo.Guest;
import iba.MySqlMapClient;

public class GuestDAO {
	SqlMapClient smc;//smc: XML내의 기술된 sql문 호출,실행
	
	public GuestDAO() {
	   smc = MySqlMapClient.getSqlMapInstance(); 
	}
	
    public boolean insert(Guest guest) {//게시물 입력
    	try {
			smc.insert("guest.insert",guest);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
      return false;	
    }//insert
    
    public boolean update(Guest guest) {//게시물 수정
      try {  
		int t = smc.update("guest.update",guest);
		if(t==1)return true;//수정된 행의 갯수가 1이라면 성공을 true리턴으로 표현
	} catch (SQLException e) {
		e.printStackTrace();
	}
      return false;	
    }//update
    
    
    
    public boolean delete(int no) {//특정 게시물 삭제
      try {
		int t = smc.delete("guest.delete", no);
		if(t==1)return true; //t:삭제된 행의 갯수가 1행이면 삭제성공!! ---> true리턴
	} catch (SQLException e) {
		e.printStackTrace();
	}	
      return false;	
    }//delete
    
    public Guest select(int no) {//특정 게시물 조회(수정폼)
      Guest guest=null;
      try {
		guest = (Guest) smc.queryForObject("guest.select",no);
	} catch (SQLException e) {
		e.printStackTrace();
	}
      return guest;	
    }//select
    
    public List<Guest> selectAll() {//모든 게시물 조회(목록)
      List<Guest> list=null;
	try {
		list = smc.queryForList("guest.selectAll");
	} catch (SQLException e) {
		e.printStackTrace();
	}
      return list;	
    }//selectAll
}


