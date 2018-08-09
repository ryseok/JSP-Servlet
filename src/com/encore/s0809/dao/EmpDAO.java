package com.encore.s0809.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.encore.s0809.vo.Emp;
import com.ibatis.sqlmap.client.SqlMapClient;

import iba.MySqlMapClient;

public class EmpDAO {
	
   SqlMapClient  sqlMap;
   
   public EmpDAO() {
      sqlMap = MySqlMapClient.getSqlMapInstance();
   }
	
   public List<Emp> selectEmpInfo(Map<String, Object> map) throws SQLException {
     return sqlMap.queryForList("emp2.selectEmpInfo", map);	   
   }
}





