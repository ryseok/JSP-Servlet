package com.encore.s0723.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class TestActionForm extends ActionForm{

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		//ActionErrors 메시지 담는 바구니 클래스
		ActionErrors err = new ActionErrors(); //에러를 담는 빈 바구니 생성
		System.out.println("validate...사용자가 입력 데이터 대한 유효성 검사");
		
		//만약 에러메시지를 담는 다면 ===> 유효하지 못한 데이터가 입력 되었다면
		//err.add("뷰와 공유할 키값", new ActionMessage("프로퍼티에 정의한 키값"));
		err.add("newkey",new ActionMessage("myErrMsg"));
		
		return err; //빈 바구니 리턴 ===> 에러 없음 
		//return null; //리턴 null ===> 에러 없음 
	}
}
