package com.encore.guest.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.guest.dao.GuestDAO;

public class GuestDeleteAction extends Action{
	//DB삭제전용 컨트롤러
	//주된업무: DB삭제
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		int no = Integer.parseInt(request.getParameter("no"));//from HTML
		
		//핵심코드
		GuestDAO dao = new GuestDAO();
		  dao.delete(no);
		
		return mapping.findForward("list");//DB삭제후 결과를 반영할 페이지 선택
   }

}
