package com.encore.t0703;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

public class CalcServlet extends HttpServlet{
	int cnt;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doget");
		
	    //브라우저에 출력될 한글에 대한 처리!!
	    resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.print("<html><head><title>서블릿계산기</title></head>" +
				  "<body><center><h3>서블릿계산기</h3><hr>" + 
				  "<form method='post'><input name=su1 type=text size=4>" + 
				  "<select name=oper><option>+</option>" + 
				  "<option>-</option><option>*</option>" + 
				  "<option>/</option></select>" + 
				  "<input type=text size=4 name=su2>" + 
				  "<input type=submit value=계산></form>" + 
				  "</center></body></html>");
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost");
		
	    //브라우저에 출력될 한글에 대한 처리!!
	    resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.print("<html><head><title>서블릿계산기</title></head>" +
				  "<body><center><h3>서블릿계산기</h3><hr>" + 
				  "<form method='post'><input name=su1 type=text size=4>" + 
				  "<select name=oper><option>+</option>" + 
				  "<option>-</option><option>*</option>" + 
				  "<option>/</option></select>" + 
				  "<input type=text size=4 name=su2>" + 
				  "<input type=submit value=계산></form>");
		//계산값 출력!!
		//1. 폼내의 데이터 얻기
		String su1 = req.getParameter("su1");  //"22"
		String su2 = req.getParameter("su2");  //"33"
		String oper = req.getParameter("oper");  //"+"
		//2. 계산실행
		Calculator calc = new Calculator( Integer.parseInt(su1),//22
				                          Integer.parseInt(su2),//33
				                          oper);
		//3. 계산결과값 얻기
		String result = calc.getResultStr();
		//"결과값: 22+33=55"
		out.print(result);
		
		out.print("</center></body></html>");	  
	}
	
}
