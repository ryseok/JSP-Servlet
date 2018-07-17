package com.encore.j0716;

import java.util.Vector;

public class InterfaceTest {
	public void printElement(Vector<String> data) {
		//백터의 내용 화면 출력
		 for (int i = 0; i < data.size(); i++) {
			   System.out.println(data.get(i));
		   } 
	}
	
	
	
	public static void main(String[] args) {
		//데이터 정의
		Vector<String> v= new Vector<>();
		v.add("나영석");
		v.add("김라임");
		v.add("홍길동");
		
		//데이터 출력
		InterfaceTest it = new InterfaceTest();
	      it.printElement(v);
	}
}
