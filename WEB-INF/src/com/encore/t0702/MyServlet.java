package com.encore.t0702;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet  extends  HttpServlet {
  //서블릿 : 한개의 웹페이지 화면 구성!!
	
  @Override
  public void init() throws ServletException {
	 //서블릿 초기화, MyServlet클래스객체에 대해 메모리 할당(적재)후 가장 먼저 1번 호출!! 
     System.out.println("init()");
  }	
  
  @Override
  protected void service(HttpServletRequest req, 
			               HttpServletResponse resp) throws ServletException, IOException {
	 //서블릿 서비스메소드  == 웹브라우저 서비스!! ===> HTML서비스
	  
	  //request:클라이언트(사용자,브라우저)   response:서버를 각각 의미!!
	  //클라이언트의 ip주소 정보 얻어오기
	  String addr = req.getRemoteAddr();
	  
	  System.out.println("service()호출한 클라이언트 ["+addr+"]");	
  
	  //(한글)문자집합 설정
	  resp.setContentType("text/html;charset=UTF-8");
	  
	  
      //웹브라우저 서비스 시작!!
	  //---> 브라우저 출력객체 얻어오기	  
	  PrintWriter out = resp.getWriter();//out==브라우저 출력객체
	   //out.print("HTML코드(텍스트)");
	   out.print("<html><head><title>서블릿타이틀</title></head>");
	   out.print("<body><h3>ServletTest</h3><hr>");
	   //out.print("Hello, Servlet~!!^^*");
	  for(int i=0; i<10; i++) { 
	    if(i%2 == 0) out.print("<b><font color=blue>안녕, 서블릿~!!^^*</font></b><br>");
	    else out.print("<b><font color=red>안녕, 서블릿~!!^^*</font></b><br>");
	  }
	   out.print("</body></html>");
	   
  }//service
  
  @Override
  public void destroy() {
	 //서블릿 메모리 소멸 전 호출 (서블릿 종료전 실행 할 작업) 
	System.out.println("destroy()");
  }
  

}