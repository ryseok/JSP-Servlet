package com.encore.s0727.vo;

import java.util.Date;

public class Emp {
	private int empno;
	private String ename;
	private Date hiredate;

	public Emp() {
		//iBatis프레임워크가 사용   new Emp()
		//언제?  resultClass속성에 Emp클래스가 명시된 경우!!
	}

	public Emp(int empno, String ename, Date hiredate) {
		super();
		this.empno = empno;
		this.ename = ename;
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

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}

	@Override
	public String toString() {
		return "Emp [empno=" + empno + ", ename=" + ename + ", hiredate=" + hiredate + "]";
	}

}