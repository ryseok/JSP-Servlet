package com.encore.s0809.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.s0724.model.Calculator;

public class MissionAction2 extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String su1 = request.getParameter("su1");
		String su2 = request.getParameter("su2");
		String oper = request.getParameter("oper");

		String result;
		String state = null;
		if (su1.trim().equals("") || su2.trim().length() == 0) {// 빈값 체크
			result = "두개의 수를 입력!!";
		} else if (!su1.matches("[0-9]+") || !su2.matches("[\\d]+")) {// 숫자 체크
			result = "숫자만 입력!!";
		} else if (oper.equals("/") && su2.equals("0")) {// 나누기 0 체크
			result = "0으로 나눌 수 없습니다!!";
		} else {// 정상
			Calculator calc = new Calculator(Integer.parseInt(su1), Integer.parseInt(su2), oper);
			result = calc.getResultStr();
			state = "success";
		}

		request.setAttribute("result", result);// '결과 데이터'를 뷰와 공유
		request.setAttribute("state", state);// '결과 데이터'를 뷰와 공유

		return mapping.findForward("result");// JSP(뷰)페이지를 따로 사용하지 않겠음
	}
}
