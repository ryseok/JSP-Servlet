package com.encore.t0713;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.encore.t0716.EmpDAO4;

@WebServlet(urlPatterns="/0713/empinfo.play") //가상의경로
public class EmpController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmpDAO3 dao = new EmpDAO3();
		req.setAttribute("empList", dao.selectAll());
		
		//forward() 또는 redirect()
		req.getRequestDispatcher("/0713/dbhistory/emp6.jsp").forward(req, resp);
	}
}//class
