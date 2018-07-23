package com.encore.s0723.actions;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.s0723.dao.LoginProcess;
import com.encore.s0723.vo.UserInfo;

public class LoginAction extends Action{ //컨트롤러 역활
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, 
								HttpServletRequest requset, HttpServletResponse response)
			throws Exception {
		//ActionMapping mapping : struts-config.xml내의 <forward>에 매핑된 정보 얻기
		//<forward> url패핑 정보 얻기
		//ActionForm form : (사용자가 입력한 데이터의 )유효성 검사를 마친 데이터를 얻을 떄 사용
		//ActionForward : 메소드 실행후 이동할 페이지에 대한 정보를 저장해서 컨트롤러으로 전달하는 용도로 사용
		
		//2. 사용자 입력 데이터 얻기
		String id = requset.getParameter("userid");
		String pwd = requset.getParameter("userpwd");
		
		//(중요!!!)3. 모델객체 생성,호출,저장
		LoginProcess lp = new LoginProcess();
		UserInfo user = lp.login(id, pwd);
		
		//4. 이동할 페이지 설정
		ActionForward forward;
		if(user == null) { //아이디 또는 비번이 없다면
			forward = mapping.findForward("fail");
		}else {
			//사용자 정보를 영역에 저장
			//영역.setAttribute("키",object 데이터);
			//requset.setAttribute("user", user); //forward 이동시 뷰와 공유
			HttpSession session = requset.getSession();
			session.setAttribute("user", user); //redirect 이동시 뷰와 공유
			forward = mapping.findForward("success");			
		}
		return forward;
	}
	
	
}
