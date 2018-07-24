package com.encore.s0724.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class CalcActionForm extends ActionForm {
	private String su1;
	private String su2;
	private String oper;

	public String getSu1() {
		return su1;
	}

	public void setSu1(String su1) {
		//System.out.println("setSu1():" + su1);
		this.su1 = su1;
	}

	public String getSu2() {
		return su2;
	}

	public void setSu2(String su2) {
		this.su2 = su2;
	}

	public String getOper() {
		return oper;
	}

	public void setOper(String oper) {
		this.oper = oper;
	}

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		System.out.println("CalcActionForm validate() : 유효성 검사");
		
        ActionErrors err = new ActionErrors();//에러(빈)바구니생성
        
        //err.calc.input={0} 입력!!
        if(su1.trim().length()==0 ||su2.length()<1){
     	   //err.calc.input 데이터를 입력!!
        	err.add("errCalc", new ActionMessage("err.calc.input"));
        	
     	}else if(!su1.matches("[0-9]+") ||!su2.matches("[\\d]+")){
     	   //err.calc.number 숫자만 입력!!
     		err.add("errCalc", new ActionMessage("err.calc.number"));
     	}else if(oper.equals("/") &&  su2.equals("0")){
     	   //err.calc.byzero 0으로 나눌 수 없습니다!!
     		err.add("errCalc", new ActionMessage("err.calc.byzero"));
     	}	
        
		return err;
	}

}
