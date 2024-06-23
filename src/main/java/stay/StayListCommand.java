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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		String checkIn = request.getParameter("checkIn")==null ? "" : request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut")==null ? "" : request.getParameter("checkOut");
		int guestMax = 0;

		try {
		    String guestMaxStr = request.getParameter("guestMax");
		    guestMax = (guestMaxStr == null || guestMaxStr.isEmpty()) ? 0 : Integer.parseInt(guestMaxStr);
		} catch (NumberFormatException e) {
		    guestMax = 0;
		}
		
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
		
		ArrayList<StayVO> vos = dao.getStayList(startIndexNo, pageSize, contentsShow, address, checkIn, checkOut, guestMax);
		
        // 검색 조건이 없을 경우 메시지 설정
        String searchMsg = null;
        if (!address.isEmpty() || (!checkIn.isEmpty() && !checkOut.isEmpty())) {
	        if (vos.isEmpty()) {
	        	searchMsg = "검색한 조건에 맞는 숙소가 없습니다.";
	        }
	        else {
	        	searchMsg = "검색 조건에 맞는 숙소를 조회합니다!";
	        }
        	request.setAttribute("searchMsg", searchMsg);
		}
		
		// 해당글의 리뷰내용 가져오기
		AdminDAO aDao = new AdminDAO();
		
		request.setAttribute("vos", vos);
		request.setAttribute("curScrStartNo", curScrStartNo);
	}

}
