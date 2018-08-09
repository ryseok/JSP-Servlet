package com.encore.s0809.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class MissionAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String username = request.getParameter("username");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(username);
		return null; //jsp사용 안해겠음!!!
	}
}
