package com.encore.guest.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import guest.vo.Guest;
import iba.MySqlMapClient;

public class GuestDAO {
	SqlMapClient smc;

	public GuestDAO() {
		smc = MySqlMapClient.getSqlMapInstance();
	}

	public boolean insert(Guest guest) {
		try {
			smc.insert("guest.insert", guest);
			return true;
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		return false;

	}// insert

	public List<Guest> selectAll() {
		List<Guest> list = null;

		try {
			list = smc.queryForList("guest.selectAll");
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		return list;
	}// selectAll
	
	public boolean update(Guest guest) {
		try {
			int t = smc.update("guest.update",guest);
			System.out.println("수정된 행 갯수T: "+ t);
			  if(t==1) {
				  return true;
			  }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}//update
	
	public Guest select(int no) {
	    Guest guest = null;	
		try {
			guest = (Guest) smc.queryForObject("guest.select",no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return guest;
	}//select
	
	public void delete(int no) {
		
	}//delete
	
	
	
	
}
