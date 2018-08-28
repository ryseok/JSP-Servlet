package guest.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import guest.dao.GuestDAO;
import guest.vo.Guest;

@WebServlet(urlPatterns = "/guest/control") // 아래 서블릿에 대한 가상의 경로!!
public class GuestController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			request.setCharacterEncoding("UTF-8");// 한글 파라미터 처리

			// System.out.println("service call...");
			// 1.요청 분석
			String action = request.getParameter("action");
			System.out.println("action==>" + action);
			GuestDAO dao = new GuestDAO();

			if (action == null || action.equals("list")) {

				// 총페이지 갯수 구하기
				// int totalRecordCount//(전체 레코드수) : 32
				// = dao.selectCount();
				int pageCount = 10;// (한 화면에 보여질 레코드수) : 10
				// int totalPage=totalRecordCount/pageCount;
				// if(totalRecordCount%pageCount>0) {//잔여 레코드가 발생
				// totalPage++;
				// }
				int totalPage = dao.selectRecordCount(pageCount);

				// 페이지 정보
				String page = request.getParameter("page");// "1" "2" "3"

				/*
				 * int pageNo; if(page==null) {//page정보를 받지않았다면 pageNo=1; }else {//page정보를 받았다면
				 * pageNo= Integer.parseInt(page); }
				 */

				if (page == null) {// page정보가 없다면
					response.sendRedirect("control?action=list&page=1");
					// 1페이지 정보를 가지고 Controller를 재호출!!
					return;
				}

				int pageNo = Integer.parseInt(page);

				// 시작글번호 ~ 끝글번호
				int end = pageNo * pageCount;// 10;
				int start = end - (pageCount - 1);// 9;

				Map<String, Integer> map = new HashMap<>();
				map.put("start", start);
				map.put("end", end);

				// 전체 게시물 정보 조회
				// request.setAttribute("list", dao.selectAll());
				request.setAttribute("list", dao.selectPage(map));
				request.setAttribute("totalPage", totalPage);

				request.getRequestDispatcher("/guest/list.jsp").forward(request, response);

			} else if (action.equals("form")) {// 1. 입력폼 요청
				request.getRequestDispatcher("/guest/inputForm.jsp").forward(request, response);
				// 4.페이지 이동
			} else if (action.equals("insert")) {// 1. DB입력요청
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
					response.sendRedirect("control?action=list");
				}
			} else if (action.equals("edit")) {// 1. 수정폼 요청

				// 수정폼에 출력할 데이터를 (DB로 부터)조회
				int no = Integer.parseInt(request.getParameter("no"));

				Guest guest = dao.select(no);// 3.
				guest.setNo(no);

				request.setAttribute("guest", guest);
				// 영역: page ---> request ---> session ---> application
				// HttpSession session = request.getSession();
				// session.setAttribute("guest", guest);
				// request.getSession().setAttribute("guest", guest);

				request.getRequestDispatcher("/guest/editForm.jsp").forward(request, response);// 4.
			} else if (action.equals("update")) {// 1. DB수정요청

				Guest guest = new Guest();
				guest.setWriter(request.getParameter("writer"));
				guest.setEmail(request.getParameter("email"));
				guest.setTel(request.getParameter("tel"));
				guest.setPass(request.getParameter("pass"));
				guest.setContents(request.getParameter("contents"));

				guest.setNo(Integer.parseInt(request.getParameter("no")));

				System.out.println("수정" + guest);

				if (dao.update(guest)) {
					response.sendRedirect("/TomTest/guest/control");
				}
			} else if (action.equals("delete")) {// 1. DB삭제 요청
				int no = Integer.parseInt(request.getParameter("no"));
				if (dao.delete(no)) {
					response.sendRedirect("/TomTest/guest/control?action=list");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// service
}
