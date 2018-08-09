package com.encore.s0809.actions;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.s0809.dao.EmpDAO;

public class MissionAction3 extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	    String search = request.getParameter("search");//검색조건  "ename", "deptno"
	    String keyword = request.getParameter("keyword");
	   
		
	    Map<String, Object> map = new HashMap<>();
	    if(search.equals("ename")) {
	    	map.put("ename", "%"+keyword+"%");//"A" ----> "%A%"
	    }else if(search.equals("deptno")) {
	    	map.put("deptno", Integer.parseInt(keyword));//"30" ---> 30
	    }
	    
	    EmpDAO dao = new EmpDAO();
	    
	    request.setAttribute("list", dao.selectEmpInfo(map));
	    
		return mapping.findForward("result");
	}
}




