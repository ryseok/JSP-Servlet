package com.encore.s0724.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.s0724.forms.CalcActionForm;
import com.encore.s0724.model.Calculator;

public class CalcAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("컨트롤러 호출 : Action");

		CalcActionForm caf = (CalcActionForm) form;
		int su1 = Integer.parseInt(caf.getSu1() );
		int su2 = Integer.parseInt(caf.getSu2() );
		String oper = caf.getOper();
		
		Calculator calc = new Calculator(su1, su2, oper);
		String result = calc.getResultStr();
		request.setAttribute("result", result);

		return mapping.findForward("form");
	}
}//class End
