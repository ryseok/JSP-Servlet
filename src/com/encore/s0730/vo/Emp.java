package com.encore.s0730.vo;

public class Emp {
	int empno;
	String ename;
	String hiredate;
	String dname;
	
	public Emp() {
		// TODO Auto-generated constructor stub
	}

	public Emp(int empno, String ename, String hiredate, String dname) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.hiredate = hiredate;
		this.dname = dname;
	}

	@Override
	public String toString() {
		return "Emp [empno=" + empno + ", ename=" + ename + ", hiredate=" + hiredate + ", dname=" + dname + "]";
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

	public String getHiredate() {
		return hiredate;
	}

	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}
	
	
}
