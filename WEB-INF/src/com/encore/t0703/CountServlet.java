package com.encore.t0703;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CountServlet extends HttpServlet{
    
	
	int cnt;//=0;
	ArrayList<String> list;
	
	public void init() throws ServletException {
		list = new ArrayList<>();//접속한 ip주소를 저장
	}//선행작업
	
	
	protected void service(HttpServletRequest request, 
			               HttpServletResponse response) throws ServletException, IOException {
	  System.out.println("service() call....");
	  
	  //웹브라우저 (HTML)출력서비스       
	  //한글처리(브라우저에게 전달되는 텍스트를 어떤 문자집합으로 해석할 지를 전달)	
	  //주의: 출력객체를 얻기 전에 설정해야 함!!
	   response.setContentType("text/html;charset=UTF-8");	
		
	   PrintWriter out; //브라우저 출력을 표현하는 객체
	               out = response.getWriter();
       //out.print("HTML태그");   <=== service메소드의 핵심코드
		                        //     - 브라우저에 출력될 HTML을 전달!!
	               
        //request:요청객체    response:응답객체	               
	               
        //클라이언트의 접속(=Session)정보
	               //request.getParameter("name");//사용자가 입력한데이터
	    String addr =  request.getRemoteAddr();//클라이언트 ip주소
	       //addr ==> "192.168.0.28"
        HttpSession session =  request.getSession();        	               
	               
        /*if(session.isNew()) {//새로운(처음) 접속을 했다면 true리턴,
        	  //ArrayList에 등록된 ip가 아니라면
        	cnt++;
        }*/
        
        System.out.println("list==> "+ list);
        //if(list.indexOf("ip주소")==-1){// --> ip주소가 존재하면  add된 index리턴
        if(!list.contains(addr)) { //ip주소가 list에 포함되었으면 true리턴
        	cnt++;
        	list.add(addr);
        }
        
		out.print("<html><head><title>ServletCounter</title></head>");
		out.print("<body><h3>ServletCounter</h3><hr>");
		out.print("조회수: "+cnt+"회</body></html>");
	   	
		
	}//service
	
	//public void destroy() {}//종료직전 작업
	
}