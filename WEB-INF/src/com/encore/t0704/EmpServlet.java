
package com.encore.t0704;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.encore.t0704.dao.EmpDAO;
import com.encore.t0704.vo.Emp;

public class EmpServlet extends HttpServlet{

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//브라우저 출력서비스
		
	   //브라우저(client)에게 어떤 문자집합을 사용할지를 전달
	   resp.setContentType("text/html;charset=UTF-8");
	   	
	   PrintWriter  out= resp.getWriter();//브라우저 출력객체 얻기
	   //out.print("HTML태그정의");
	   out.print("<html><head><title>사원정보</title></head><body><center>");
	   out.print("<h3>사원정보</h3><hr><table border=1 cellpadding=5>");
	   out.print("<tr bgcolor='99ffcc'><th>사원번호</th><th>사원명</th><th>입사일</th>"
	   		       + "<th>급여</th><th>부서명</th></tr>");
	   
	   
	   //EmpDAO dao = new EmpDAO();
	   //ArrayList<Emp> list = dao.findAll();
	   
//	   for(int i=0; i<list.size(); i++) {
//		    Emp emp = list.get(i);
//		       int empno = emp.getEmpno();
//	     out.print("<tr><td>"+empno+"</td><td>"+ emp.getEname() +"</td>"
//	   		+ "<td>"+emp.getHiredate()+"</td><td>"+emp.getSal()
//	   		+"</td><td>"+emp.getDname()+"</td></tr>");
//	   }
	   
	   out.print("</table></body></html>");
	   
	}//service
}




