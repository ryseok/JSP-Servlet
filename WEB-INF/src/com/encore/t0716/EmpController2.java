package com.encore.t0716;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.encore.t0713.EmpDAO3;

@WebServlet(urlPatterns="/0716/empinfo") //가상의경로
public class EmpController2 extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmpDAO4 dao = new EmpDAO4();
		req.setAttribute("empList", dao.selectAll());
		
		req.getRequestDispatcher("/0716/emp7.jsp").forward(req, resp);
	}
}//class
