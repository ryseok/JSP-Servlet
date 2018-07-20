package com.encore.s0720.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class MyAction extends Action{
	//Action == Controller 개념
	
	//Action 특성 메소드 ===> execute()
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//1.요청 분석,파라미터분석 2.데이터 얻기 3.모델호출,영역저장  4.페이지 이동  : (상황에 따라 변한다)
		System.out.println("MyAction execute()");
		
		ActionForward forward = null; //보여줄 결과물 없음 !!!
		//forward = mapping.findForward(xml에 정의된 forwardName)
		forward = mapping.findForward("success");
		forward = mapping.findForward("fail");
		forward = mapping.findForward("hello");
		return forward; //4번
	}
}//class End
