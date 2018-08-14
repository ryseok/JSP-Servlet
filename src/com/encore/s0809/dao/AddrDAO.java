package com.encore.s0809.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import iba.MySqlMapClient;

public class AddrDAO {
   SqlMapClient sqlMap;
   
   public AddrDAO() {
	 sqlMap = MySqlMapClient.getSqlMapInstance();
   }
   
   public List<String> findSido() throws SQLException {
	  return sqlMap.queryForList("addr.sido");
   }
   
   public List<String> findGugun(String sido) throws SQLException {
	  return sqlMap.queryForList("addr.gugun", sido); 
   }
   public List<String> findDong(Map<String, String> map) throws SQLException {
	  return sqlMap.queryForList("addr.dong", map); 
   }
}


