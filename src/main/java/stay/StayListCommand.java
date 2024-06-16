package stay;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.AdminDAO;
import admin.review.ReviewVO;

public class StayListCommand implements StayInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		String checkIn = request.getParameter("checkIn")==null ? "" : request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut")==null ? "" : request.getParameter("checkOut");
		int guestMax = request.getParameter("guestMax")==null ? 0 : Integer.parseInt(request.getParameter("guestMax"));
		
		HttpSession session = request.getSession();
		String sMid = (String) session.getAttribute("sMid");
		String contentsShow = "";
		if (sMid == null) {
			contentsShow = "guest";
		} else if (sMid.equals("admin")) {
			contentsShow = "adminOK";
		} else {
			contentsShow = sMid;
		}

		StayDAO dao = new StayDAO();
		
		// 페이징처리
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 6 : Integer.parseInt(request.getParameter("pageSize"));
		int totRecCnt = dao.getTotRecCnt(contentsShow,"","");
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		ArrayList<StayVO> vos = dao.getStayList(startIndexNo, pageSize, contentsShow, null, null);
		
		// 해당글의 리뷰내용 가져오기
		AdminDAO aDao = new AdminDAO();
		
		request.setAttribute("vos", vos);
		request.setAttribute("curScrStartNo", curScrStartNo);
	}

}
