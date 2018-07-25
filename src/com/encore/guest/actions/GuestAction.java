package com.encore.guest.actions;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.guest.dao.GuestDAO;

import com.encore.guest.vo.Guest;

public class GuestAction extends Action{
	
	@Override
	public ActionForward execute(ActionMapping mapping, 
			                    ActionForm form, 
			                    HttpServletRequest request,
			                    HttpServletResponse response) throws Exception {
        
		//  요청URL : /struts/guest.do?action=데이터
		
	 String action = request.getParameter("action");
	    //"list" "form" "insert"
	 System.out.println("action="+action);
	 
	     GuestDAO dao = new GuestDAO();
	 
	  ActionForward forward=null;
	    if(action==null || action.equals("list")) {//목록요청
	    	 List<Guest> list = dao.selectAll();
	    	 request.setAttribute("list", list);
	    	 
	    	forward = mapping.findForward("list");
	    }else if(action.equals("form")) {//입력폼요청
	    	forward = mapping.findForward("form");
	    }else if(action.equals("insert")) {//DB입력요청
	    		    	
	    	//5개의 파라미터 데이터를 한개의 변수명으로 묶어주기
	    	Guest guest = new Guest(0, 
					    			request.getParameter("writer"), 
					    			request.getParameter("email"), 
					    			request.getParameter("tel"), 
					    			request.getParameter("pass"), 
					    			request.getParameter("contents"), 
	    			                null);
	    	
	    	
	    	boolean flag = dao.insert(guest);
	    	/*PrintWriter out = response.getWriter();
	    	if(flag) {//입력 성공
	    		out.print("입력성공!!<br><a href='guest.do?action=list'>리스트이동</a>");
	    	}else {//입력 실패
	    		out.print("입력실패!!<br><a href='guest.do?action=form'>입력폼이동</a>");
	    	}*/
	    	if(flag) {
	    		forward = mapping.findForward("insert");
	    	}
	    	
	    }
		
	   return forward; 
	}//execute

}
