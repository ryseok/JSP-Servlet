package com.encore.s0727.actions;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.s0727.dao.EmpDAO;

public class EmpAction extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	    //나는 컨트롤러!!
		String str = request.getParameter("deptno");
		System.out.println("str===>"+str);
		int deptno;
		EmpDAO dao = new EmpDAO();
		if(str.length()==0) { //빈 문자열 검사
			deptno = dao.selectMinDeptno();
		}else {
			deptno = Integer.parseInt(str);
			if(!dao.selectExistDeptno(deptno)) {
				//JSP없이 메시지 출력
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out =  response.getWriter(); //브라우저 출력객체
				out.print("<font color='red'>존재 하지 않는 부서입니다.</font>");
				return null;
			}
			
		}
		
		
		request.setAttribute("deptno",deptno);
		request.setAttribute("list",dao.selectInfo(deptno));
		 
		return mapping.findForward("response8");
	}//execute_End
}//class_End


