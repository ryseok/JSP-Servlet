package com.encore.s0802.actions;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.encore.s0802.dao.ReplyDAO;
import com.encore.s0802.dto.Reply;

public class ReplyAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// 입력,조회,수정,삭제 중 요청 분석
		String action = request.getParameter("action");
		System.out.println("댓글 액션>>>" + action);

		// 3.
		ReplyDAO dao = new ReplyDAO();
		String forwardName = "";

		if (action == null) {
			action = "list";
		} // action파라미터가 전달되지 않았을때 기본값을 list!!
		switch (action) {
		case "list": // 댓글 전체 목록 요청
			request.setAttribute("list", dao.findAll());
			forwardName = "list";// reply_list.jsp로 이동!!
			break;

		case "insert": {// 댓글 입력 요청
			// 2.
			String name = request.getParameter("name");
			String content = request.getParameter("content");

			Reply reply = new Reply();// 두변수를 한개로 통합
			reply.setName(name);
			reply.setContent(content);

			if (dao.create(reply)) {// 입력성공
				request.setAttribute("msg", "입력성공!!");
				/*
				 * response.getWriter().print("InputSuccess!!"); return null; ----> JSP페이지 없이 짧은
				 * 메시지를 직접 클라이언트에게 전달!!
				 */
			} else {
				request.setAttribute("msg", "입력실패!!");
			}

			forwardName = "result";
		}
			break;

		case "update":// 댓글 수정요청
			String name = request.getParameter("name");
			String content = request.getParameter("content");
			int no = Integer.parseInt(request.getParameter("no"));

			Reply reply = new Reply();// 세 변수를 한개로 통합
			reply.setName(name);
			reply.setContent(content);
			reply.setNo(no);

			System.out.println("수정댓글VO: " + reply);

			if (dao.modify(reply)) {// 수정성공
				request.setAttribute("msg", "수정성공!!");
			} else {
				request.setAttribute("msg", "수정실패!!");
			}

			forwardName = "result";
			break;

		case "remove": // 댓글 삭제
			int delNo = Integer.parseInt(request.getParameter("no"));
			Reply delReply = new Reply();
			delReply.setNo(delNo);

			response.setContentType("html/text;charset=UTF-8"); // 한글을 사용 한다면
			PrintWriter out = response.getWriter();
			if (dao.remove(delNo)) {
				// request.setAttribute("msg", "삭제성공");
				out.print("삭제성공");
			} else {
				// request.setAttribute("msg", "삭제실패");
				out.print("삭제실패");
			}
			return null;
		// break;
		}// switch

		return mapping.findForward(forwardName);
		// 저장된 데이터(msg키에 저장된 데이터)를 출력할 reply_result.jsp 이동!!
	}// execute
}
