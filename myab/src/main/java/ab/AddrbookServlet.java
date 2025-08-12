package ab;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ab.AddrBookDAO;
import ab.AddrBookVO;

@WebServlet("*.do") // 앞에 /붙이면 에러
public class AddrbookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 여기서 addrbook_control.jsp가 하는 일을 수행한다.
		req.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		System.out.println("uri= " + uri);
		String forwardPage = "/addrbook_list.jsp";
		AddrBookDAO dao = new AddrBookDAO();
		try {
			if(uri.endsWith("/insert.do")) {
				AddrBookVO ab = makeAddrBookFromReq(req);
				dao.insertDB(ab);
				List<AddrBookVO> list = dao.getDBList();
				req.setAttribute("data",list);
				
			} else if(uri.endsWith("/edit.do")) {
				String abIdStr = req.getParameter("ab_id");
				AddrBookVO vo = dao.getDB(Integer.parseInt(abIdStr));
				req.setAttribute("ab", vo);
				forwardPage = "/addrbook_edit_form.jsp";
				
			} else if(uri.endsWith("/list.do")) {
				List<AddrBookVO> list = dao.getDBList();
				req.setAttribute("data",list);
			
			} else if(uri.endsWith("/delete.do")) {
				String abIdStr = req.getParameter("ab_id");
				dao.deleteDB(Integer.parseInt(abIdStr));
				
			} else if(uri.endsWith("/form.do")) {
				forwardPage = "/addrbook_form.jsp";
			} 
		} catch(Exception e) {
			
		}
		req.getRequestDispatcher(forwardPage).forward(req, res); // 이거 한줄만 넣어두 ㄱㅊ
	}

	private AddrBookVO makeAddrBookFromReq(HttpServletRequest req) {
		AddrBookVO vo = new AddrBookVO();
		vo.setAbName(req.getParameter("abName"));
		vo.setAbTel(req.getParameter("abTel"));
		vo.setAbComdept(req.getParameter("abComdept"));
		vo.setAbMemo(req.getParameter("abMemo"));
		vo.setAbEmail(req.getParameter("abEmail"));
		vo.setAbBirth(req.getParameter("abBirth"));
		return vo;
	}
}
