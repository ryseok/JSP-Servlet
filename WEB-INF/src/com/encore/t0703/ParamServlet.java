package com.encore.t0703;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ParamServlet extends HttpServlet{
  //폼내의 데이터, 파라미터(전달) 데이터를 얻어오는 서블릿!!
	
  @Override
  protected void service(HttpServletRequest req, 
		                 HttpServletResponse resp) throws ServletException, IOException {
     //클라이언트의 요청 방식에 따라 doGet() 또는 doPost()로 분기
	 System.out.println("service()"); 
	 
	 //HTTP요청방식(get,post) 정보 얻어오기 --> HTTP요청은 클라이언트가 주체
	 String method = req.getMethod();//"GET"  "POST"
	 System.out.println("HTTP요청방식(method)="+ method);
	 if(method.equals("GET")) {
		 doGet(req,resp);
	 }else {
		 doPost(req,resp);
	 }
	 
  }//service 	
 
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     System.out.println("doGet()");
     
     //TomTest/0703/result?id=gildong&pwd=1234
     //String 속성값=req.getParameter("name 속성");
     String id = req.getParameter("id");
     String pwd = req.getParameter("pwd");
     System.out.println("전달받은 id : "+id+",  비번 : "+pwd);
  }
  
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 System.out.println("doPost()");
  }

}


