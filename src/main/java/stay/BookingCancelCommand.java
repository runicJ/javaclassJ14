package stay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookingCancelCommand implements StayInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bIdx = request.getParameter("bIdx")==null ? 0 : Integer.parseInt(request.getParameter("bIdx"));
		
		StayDAO dao = new StayDAO();

		int res = dao.setBookingCancel(bIdx);
		
		if(res != 0) {
			request.setAttribute("message", "예약이 취소되었습니다.");
			request.setAttribute("url", "MemberBookingList.mem");
		}
		else {
			request.setAttribute("message", "예약 취소 실패!");
			request.setAttribute("url", "MemberBookingList.mem");
		}
	}

}
