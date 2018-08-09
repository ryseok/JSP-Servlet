package com.encore.s0809.vo;

import java.sql.Date;

public class Emp {
	private int empno;
	private String ename;
	private int sal;
	private int deptno;
	private Date hiredate;

	public Emp() {
		// TODO Auto-generated constructor stub
	}

	public Emp(int empno, String ename, int sal, int deptno, Date hiredate) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.sal = sal;
		this.deptno = deptno;
		this.hiredate = hiredate;
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

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}

	@Override
	public String toString() {
		return "Emp [empno=" + empno + ", ename=" + ename + ", sal=" + sal + ", deptno=" + deptno + ", hiredate="
				+ hiredate + "]";
	}

}