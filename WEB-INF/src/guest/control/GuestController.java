package guest.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.dao.GuestDAO;
import guest.vo.Guest;

@WebServlet(urlPatterns="/guest/control")//�Ʒ� ������ ���� ������ ���!!
public class GuestController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, 
			               HttpServletResponse response) throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");//�ѱ� �Ķ���� ó��
		
		//System.out.println("service call...");
       //1.��û �м�
       String action = request.getParameter("action");
       System.out.println("action==>"+ action);
       GuestDAO dao = new GuestDAO();
       
       if(action == null || action.equals("list")) {
    	   //��ü �Խù� ���� ��ȸ
    	   request.setAttribute("list", dao.selectAll());
    	   
    	   request.getRequestDispatcher("/guest/list.jsp")
    	   .forward(request, response);
    	   
       }else if(action.equals("form")) {//1. �Է��� ��û
    	  request.getRequestDispatcher("/guest/inputForm.jsp")
    	         .forward(request, response);
    	  //4.������ �̵� 
       }else if(action.equals("insert")) {//1. DB�Է¿�û
    	   //2. �Է������� ������ ������
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
    	   
    	   //3. DAO��ü����, ȣ��
    	     if(dao.insert(guest)) {
    	    	 //4. ������ �̵�  (���߰��� �ݿ��� list.jsp���̱�)
    	    	 response.sendRedirect("control?action=list");  
    	     }
       }
       
	}//service
}





