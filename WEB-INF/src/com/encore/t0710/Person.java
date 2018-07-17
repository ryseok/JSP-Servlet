package com.encore.t0710;

import java.net.StandardSocketOptions;

public class Person {
	String name;
	int age;
	String job;

	public Person() {
		System.out.println("기본생성자");
	}
	
	
	public Person(String name, int age, String job) {
		System.out.println("오버로딩 생성자");
		this.name = name;
		this.age = age;
		this.job = job;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	@Override
	public String toString() {
		return "Person [name=" + name + ", age=" + age + ", job=" + job + "]";
	}
	
	
}
