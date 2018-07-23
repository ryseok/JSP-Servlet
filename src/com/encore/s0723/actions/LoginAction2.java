package com.encore.s0723.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.encore.s0723.dao.LoginProcess;
import com.encore.s0723.forms.LoginActionForm;
import com.encore.s0723.vo.UserInfo;

public class LoginAction2 extends Action{
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
    		HttpServletResponse response) throws Exception {
    	//ActionForm을 거친 Action의 차이점
    	/*
    	 *Action만 사용시 : String userid = request.getParameter("userid");
    	 *ActionForm과 Action사용시 : String userid = form.getUserid(); ===> 유효성 검증된 데이터를 받겠음
    	 */

    	//모델호출!! (아이디와 비번 검사)
        System.out.println("execute()");
        
        LoginActionForm laf = (LoginActionForm) form;
        String id = laf.getUserid();
        String pass = laf.getUserpwd();
        
        LoginProcess lp = new LoginProcess();
        UserInfo user = lp.login(id, pass);
        //System.out.println("LoginAction2 user="+user);
        if(user==null) {
        	ActionMessages msgs = new ActionMessages();
        	
        	msgs.add(ActionMessages.GLOBAL_MESSAGE,new ActionMessage("error.invalidlogin"));
        	saveMessages(request, msgs);
        	return mapping.getInputForward(); //액션태그의 input속성에 정의된 경로
        }else {
        	//세션 영역에 사용자 정보 저장
        	request.getSession().setAttribute("user", user);
        	return mapping.findForward("loginForm2");
        }
    }
}