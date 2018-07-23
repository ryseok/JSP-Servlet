package com.encore.s0723.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class LoginActionForm extends ActionForm {
	// ActionForm : 사용자가 입력한 데이터를 검사(유효성 검사)
	// ----> 유효성검사에 필요한 필드 정의(HTML name과 일치하는 속성정의, 속성에 대한 게터,세터메소드)
	// ----> 특성메소드 validate()

	//주의사항) private int, age; 보다 private String age; 꼭!!! 사용해라
	private String userid;
	private String userpwd;

	public String getUserid() {
		System.out.println("getUserid()");
		return userid;
	}

	public void setUserid(String userid) {
		System.out.println("setUserid():"+userid);
		this.userid = userid;
	}

	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		// 유효성 검사!! (id==>빈값,공백문자    pass==>빈값)
		System.out.println("validate()");
		
		ActionErrors err = new ActionErrors();//에러메시지 빈 바구니
		
	    if(userid==null || userid.length()==0) {//빈값
	    	//err.add("새로운키값", new ActionMessage("프로퍼티파일에 정의된 키값"));
	    	err.add("errid", new ActionMessage("error.invalidid","아이디 입력!!"));
	    }else if(userid.indexOf(" ") > -1 ||
	    		 userid.indexOf("\t") >=0 ||
	    		 userid.indexOf("\n") >-1 ){//공백문자
	    	err.add("errid", new ActionMessage("error.invalidid","아이디에 공백을 제거!!"));
	    }
	    //-------------------------------------------------
	    if(userpwd==null || userpwd.equals("")) {//빈값
	    	err.add("errpass", new ActionMessage("error.invalidpass"));
	    }
	    
	    //String str=" gildong"; str.indexOf(" ") ---> 0
	    //String str2="gil dong"; str2.indexOf(" ") ---> 3
	    //String str3="gildong"; str3.indexOf(" ") ---> -1
		
		
		return err;
	}
	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}


}