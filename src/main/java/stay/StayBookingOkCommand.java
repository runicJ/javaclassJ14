package stay;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StayBookingOkCommand implements StayInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sIdx = request.getParameter("sIdx")==null ? 0 : Integer.parseInt(request.getParameter("sIdx"));
		HttpSession session = request.getSession();
		String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
        String checkIn = request.getParameter("checkInPayment")==null ? "" : request.getParameter("checkInPayment");
        String checkOut = request.getParameter("checkOutPayment")==null ? "" : request.getParameter("checkOutPayment");
        int guestNum = request.getParameter("guestNumPayment")==null ? 0 : Integer.parseInt(request.getParameter("guestNumPayment"));
        int total = request.getParameter("totalPayment")==null ? 0 : Integer.parseInt(request.getParameter("totalPayment"));
        
        StayDAO dao = new StayDAO();
                
        BookingVO vo = new BookingVO();
        vo.setsIdx(sIdx);
        vo.setMid(mid);
        vo.setCheckIn(checkIn);
        vo.setCheckOut(checkOut);
        vo.setGuestNum(guestNum);
        vo.setTotal(total);

        int res = dao.StayBookingOk(vo);

        if (res != 0) {
            request.setAttribute("message", "예약이 완료되었습니다.");
            request.setAttribute("url", "MemberBookingList.mem");
        } 
        else {
        	request.setAttribute("message", "예약 실패!");
        	request.setAttribute("url", "StayDetail.st?sIdx=" + sIdx);
        }

	}

}
