package guest.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.dao.GuestDAO;
import guest.vo.Guest;

@WebServlet(urlPatterns="/guest/control")//아래 서블릿에 대한 가상의 경로!!
public class GuestController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, 
			               HttpServletResponse response) throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");//한글 파라미터 처리
		
		//System.out.println("service call...");
       //1.요청 분석
       String action = request.getParameter("action");
       System.out.println("action==>"+ action);
       GuestDAO dao = new GuestDAO();
       
       if(action == null || action.equals("list")) {
    	   //전체 게시물 정보 조회
    	   request.setAttribute("list", dao.selectAll());
    	   
    	   request.getRequestDispatcher("/guest/list.jsp")
    	   .forward(request, response);
    	   
       }else if(action.equals("form")) {//1. 입력폼 요청
    	  request.getRequestDispatcher("/guest/inputForm.jsp")
    	         .forward(request, response);
    	  //4.페이지 이동 
       }else if(action.equals("insert")) {//1. DB입력요청
    	   //2. 입력폼내의 데이터 얻어오기
    	   String writer = request.getParameter("writer");
    	   String email = request.getParameter("email");
    	   String tel = request.getParameter("tel");
    	   String pass = request.getParameter("pass");
    	   String contents = request.getParameter("contents");
    	       	   
    	   Guest guest = new Guest();
         //new Guest(0, writer, email, tel, pass, contents, null);
    	         guest.setWriter(writer);
    	         guest.setEmail(email);
    	         guest.setTel(tel);
    	         guest.setPass(pass);
    	         guest.setContents(contents);
    	   
    	   //3. DAO객체생성, 호출
    	     if(dao.insert(guest)) {
    	    	 //4. 페이지 이동  (행추가를 반영한 list.jsp보이기)
    	    	 response.sendRedirect("control?action=list");  
    	     }
       }
       
	}//service
}





