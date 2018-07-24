package com.encore.guest.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.guest.dao.GuestDAO;

import guest.vo.Guest;

public class GuestAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// 요청URL : /struts/guest.do?action=데이터
		String action = request.getParameter("action");
		System.out.println("action : " + action);
		GuestDAO dao = new GuestDAO();

		ActionForward forward = null;
		if (action == null || action.equals("list")) {// 목록요청
			forward = mapping.findForward("list");
			request.setAttribute("list", dao.selectAll());
		} else if(action.equals("form") ){// if(action.equals("form"))//입력폼요청
			forward = mapping.findForward("form");
		}else if(action.equals("insert")) {
			
			// 2. 입력폼내의 데이터 얻어오기
			String writer = request.getParameter("writer");
			String email = request.getParameter("email");
			String tel = request.getParameter("tel");
			String pass = request.getParameter("pass");
			String contents = request.getParameter("contents");

			Guest guest = new Guest();
			// new Guest(0, writer, email, tel, pass, contents, null);
			guest.setWriter(writer);
			guest.setEmail(email);
			guest.setTel(tel);
			guest.setPass(pass);
			guest.setContents(contents);

			// 3. DAO객체생성, 호출
			if (dao.insert(guest)) {
				// 4. 페이지 이동 (행추가를 반영한 list.jsp보이기)
				//response.sendRedirect("control?action=list");
				forward = mapping.findForward("insert");
			}
		}
//		else if (action.equals("update")) {// 1. DB수정요청
//
//			Guest guest = new Guest();
//			guest.setWriter(request.getParameter("writer"));
//			guest.setEmail(request.getParameter("email"));
//			guest.setTel(request.getParameter("tel"));
//			guest.setPass(request.getParameter("pass"));
//			guest.setContents(request.getParameter("contents"));
//
//			guest.setNo(Integer.parseInt(request.getParameter("no")));
//
//			System.out.println("수정" + guest);
//
//			if (dao.update(guest)) {
//				forward = mapping.findForward("update");
//			}
//		}
		// return mapping.findForward("form");
		// return mapping.findForward(action);

		return forward;
	}// execute

}