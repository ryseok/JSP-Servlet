package com.encore.s0809.actions;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.s0809.dao.AddrDAO;

public class MissionAction4 extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
        
		AddrDAO dao = new AddrDAO();
		String delim = request.getParameter("delim");
		System.out.println("요청 구분: "+ delim);
		if(delim.equals("sido")) {
		  request.setAttribute("list", dao.findSido());//List<String>
		}else if(delim.equals("gugun")) {
		  String sido = request.getParameter("sido");
		  System.out.println("요청 시도 :"+ sido);
		  request.setAttribute("list", dao.findGugun(sido));//List<String>
		}else if(delim.equals("dong")) {
		  Map<String, String> map = new HashMap<>();
		    map.put("sido", request.getParameter("sido"));
		    map.put("gugun", request.getParameter("gugun"));
		  request.setAttribute("list", dao.findDong(map));//List<String>
		}
		
		return mapping.findForward("result");
	}
}




