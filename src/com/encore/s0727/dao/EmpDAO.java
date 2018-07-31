package com.encore.s0727.dao;

import java.sql.SQLException;
import java.util.List;

import com.encore.s0727.vo.Emp;
import com.ibatis.sqlmap.client.SqlMapClient;

import iba.MySqlMapClient;

public class EmpDAO {
	SqlMapClient smc;	

	public EmpDAO() {
		smc = MySqlMapClient.getSqlMapInstance();
	}

	public List<String> selectNames() throws SQLException {
		return smc.queryForList("emp.selectNames");
	}

	public List<Emp> selectInfo(int deptno) {
		List<Emp> list = null;
		try {
			list = smc.queryForList("emp.selectInfo", deptno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<String> selectKeyword(String ename) {
		List<String> list = null;
		try {
			list = smc.queryForList("emp.selectKeyword", ename);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List<com.encore.s0730.vo.Emp> selectEmpInfo(String ename) throws SQLException {
		return smc.queryForList("emp.selectEmpInfo",ename);
	}

	public int selectMinDeptno() {
		Integer minNo = 0;
		try {
			minNo = (Integer) smc.queryForObject("emp.selectMinDeptno");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return minNo;
	}

	public boolean selectExistDeptno(int deptno) {
		try {
			Integer count = (Integer) smc.queryForObject("emp.selectExistDeptno", deptno);

			if (count > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
