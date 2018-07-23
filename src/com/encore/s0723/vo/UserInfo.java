package com.encore.s0723.vo;

public class UserInfo { //이름,이메일,전화번호를 묶어 주는 빈
	private String name;
	private String email;
	private String tel;
	
	
	public UserInfo() {
		// TODO Auto-generated constructor stub
	}


	public UserInfo(String name, String email, String tel) {
		super();
		this.name = name;
		this.email = email;
		this.tel = tel;
	}


	@Override
	public String toString() {
		return "UserInfo [name=" + name + ", email=" + email + ", tel=" + tel + "]";
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
}
