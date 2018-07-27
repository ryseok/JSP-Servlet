package com.encore.s0713;

import java.sql.Date;

public class Emp {
	int empno;
	String ename;
	Date hiredate;
	
	
	public Emp() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Emp(int empno, String ename, Date hiredate) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.hiredate = hiredate;
	}
	@Override
	public String toString() {
		return "Emp [empno=" + empno + ", ename=" + ename + ", hiredate=" + hiredate + "]";
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	
	
	
	
	
	
}


