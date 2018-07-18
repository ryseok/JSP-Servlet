package guest.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.dao.GuestDAO;
import guest.vo.Guest;

@WebServlet(urlPatterns = "/guest/control") // �Ʒ� ������ ���� ������ ���!!
public class GuestController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// System.out.println("service call...");

		String action = request.getParameter("action");
		System.out.println("action==>" + action);
		GuestDAO dao = new GuestDAO();
		
		
		if (action == null || action.equals("list")) {
			
			request.setAttribute("list", dao.selectAll());

			request.getRequestDispatcher("/guest/list.jsp").forward(request, response);

		} else if (action.equals("form")) {
			request.getRequestDispatcher("/guest/inputForm.jsp").forward(request, response);
			
		} else if (action.equals("insert")) {
			
			String writer = request.getParameter("writer");
			String email = request.getParameter("email");
			String tel = request.getParameter("tel");
			String pass = request.getParameter("pass");
			String contents = request.getParameter("contents");

			// new Guest(0, writer, email, tel, pass, contents, null);
			Guest guest = new Guest();
			guest.setWriter(writer);
			guest.setEmail(email);
			guest.setTel(tel);
			guest.setPass(pass);
			guest.setContents(contents);

			
			if (dao.insert(guest)) {
				response.sendRedirect("control?action=list");
			}
		}else if(action.equals("edit")) { //list ===> editForm.jsp로 이동!!!
			 //수정폼에 출력할 데이터를 (DB로 부터)조회
	    	   int no= Integer.parseInt(request.getParameter("no"));
	    	   
	    	   Guest guest = dao.select(no);//3.
	    	          guest.setNo(no);
	    	   //System.out.println("수정할"+guest);
	    	   request.setAttribute("guest", guest);
	    	   
	    	   request.getRequestDispatcher("/guest/editForm.jsp")
	    	          .forward(request, response);//4.

		}else if(action.equals("update")) {//1. DB수정요청
	    	   
	    	  Guest guest = new Guest();
	    	     guest.setWriter(request.getParameter("writer"));
	    	     guest.setEmail(request.getParameter("email"));
	    	     guest.setTel(request.getParameter("tel"));
	    	     guest.setPass(request.getParameter("pass"));
	    	     guest.setContents(request.getParameter("contents"));
	    	     
	    	     guest.setNo(Integer.parseInt(request.getParameter("no")));
	    	     
	          System.out.println("수정"+guest);  
	          
	    	  if(dao.update(guest)) {
	    		  response.sendRedirect("/TomTest/guest/control?action=list");
	    	  }
	       }else if(action.equals("delete")) {//1. DB삭제 요청
	    	   int no = Integer.parseInt(request.getParameter("no"));
	    	   if(dao.delete(no)) {
	    		   response.sendRedirect("/TomTest/guest/control?action=list");
	    	   }
	       }


	}// service
}
