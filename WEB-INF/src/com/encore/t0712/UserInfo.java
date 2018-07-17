package com.encore.t0712;

public class UserInfo {
	String id; 
	int pass;
	String name;  
	int jumin;
	int birth;  
	String zip;
	String addr;
	String email;
	String job;
	
	public UserInfo() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public UserInfo(String id, int pass, String name, int jumin, int birth, String zip, String addr, String email,
			String job) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.jumin = jumin;
		this.birth = birth;
		this.zip = zip;
		this.addr = addr;
		this.email = email;
		this.job = job;
	}


	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", pass=" + pass + ", name=" + name + ", jumin=" + jumin + ", birth=" + birth
				+ ", zip=" + zip + ", addr=" + addr + ", email=" + email + ", job=" + job + "]";
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPass() {
		return pass;
	}
	public void setPass(int pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getJumin() {
		return jumin;
	}
	public void setJumin(int jumin) {
		this.jumin = jumin;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	
	
}
