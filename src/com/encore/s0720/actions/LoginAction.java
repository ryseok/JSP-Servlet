package com.encore.s0720.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class LoginAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//배열은 for문과 친하다 ;) 
		String[] id = { "gildong", "lime", "juwon" };
		String[] pass = { "111", "222", "333" };
		
		//로그인폼에서 작성한 것이 url 에 있고 그것을 가지고 온다(method="post" 에서 실제로는 안보임)
		String userid = request.getParameter("id");
		String userpass = request.getParameter("pass");
		
		//이동할 페이지에 대한 정보를 저장하는 객체
		//기본값 초기화
		ActionForward forward = mapping.findForward("fail");
		for(int i=0; i<id.length; i++) {
			if(userid.equals(id[i]) && userpass.equals(pass[i])) {
				forward = mapping.findForward("success");	
			}			
		}
		return forward;			
	}
}//class End
