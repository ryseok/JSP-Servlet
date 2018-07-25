package com.encore.guest.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.guest.dao.GuestDAO;
import com.encore.guest.vo.Guest;

public class GuestUpdateAction extends Action{
   //DB수정처리 전용 컨트롤러
   //주된일:  DB수정(to DB)   <==== (from HTML)수정할 정보 얻기	
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		Guest guest = new Guest();
           guest.setWriter(request.getParameter("writer")); 
           guest.setEmail(request.getParameter("email")); 
           guest.setTel(request.getParameter("tel"));
           guest.setPass(request.getParameter("pass")); 
           guest.setContents(request.getParameter("contents")); 
		   guest.setNo(Integer.parseInt(request.getParameter("no")));
           
        System.out.println("DB에 전달할 Guest==>"+ guest);   
           
		//핵심
		GuestDAO dao = new GuestDAO();
		dao.update(guest);
		
		return mapping.findForward("list");//수정결과 반영 ---> list.jsp
	}
}





