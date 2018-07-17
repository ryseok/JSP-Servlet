package com.encore.t0711;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.encore.t0706.dao.EmpDAO;
import com.encore.t0706.vo.Emp;

@WebServlet(urlPatterns="/0711/empInfo") //web.xml에 서블릿등록을 생략 할 수 있다.
public class Controller extends HttpServlet {
	@Override
	public void init() throws ServletException {
		System.out.println("init()");
	}// init End

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 요청분석 
		 * 입력데이터 얻기 
		 * 모델객체생성, 호출, 영역저장 
		 * 페이지이동 유효성 검사
		 */
		
		System.out.println("service...call");
		
		//3.
		EmpDAO dao =new EmpDAO();
		ArrayList<Emp> list = dao.selectGradeInfo();
		request.setAttribute("list", dao.selectGradeInfo());
		
		//4. forward 또는 redirect 이동
		request.getRequestDispatcher("/0711/emp_Info.jsp").forward(request, response);
		

	}// service End

	@Override
	public void destroy() {
		System.out.println("destroy()");
	}// destroy End
}// class End
