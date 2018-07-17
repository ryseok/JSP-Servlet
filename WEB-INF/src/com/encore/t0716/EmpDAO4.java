package com.encore.t0716;

import java.sql.SQLException;
import java.util.List;

import com.encore.t0713.Emp;
import com.ibatis.sqlmap.client.SqlMapClient;

import iba.MySqlMapClient;

public class EmpDAO4 {
	SqlMapClient smc = MySqlMapClient.getSqlMapInstance();
    
	public List<Emp> selectAll() {
	
		 List<Emp> list = null;
			try {
				list = smc.queryForList("emp.selectAll");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return list;
	}
	
	
	
	
	
	
	
	
	
	
}
