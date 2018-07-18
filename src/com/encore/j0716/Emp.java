package com.encore.j0716;

public class Emp {
	private  int empno;
	private String ename;
	private int sal;
	private int deptno;
	
	public Emp() {
		// TODO Auto-generated constructor stub
	}//기본 생성자

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

	@Override
	public String toString() {
		return "Emp [empno=" + empno + ", ename=" + ename + ", sal=" + sal + ", deptno=" + deptno + "]";
	}
	
	
}
