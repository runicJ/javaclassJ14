package stay;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StayBookingCommand implements StayInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sIdx = request.getParameter("sIdx")==null ? 0 : Integer.parseInt(request.getParameter("sIdx"));
        String checkInStr = request.getParameter("checkIn")==null ? "" : request.getParameter("checkIn");
        String checkOutStr = request.getParameter("checkOut")==null ? "" : request.getParameter("checkOut");
        int guestNum = request.getParameter("guestNum")==null ? 0 : Integer.parseInt(request.getParameter("guestNum"));
        int price = request.getParameter("price")==null ? 0 : Integer.parseInt(request.getParameter("price"));

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        if (checkInStr == null || checkInStr.isEmpty() || checkOutStr == null || checkOutStr.isEmpty()) {
            request.setAttribute("message", "체크인 또는 체크아웃 날짜가 비어있을 수 없습니다.");
            request.setAttribute("url", "StayDetail.st?sIdx=" + sIdx);
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            return;
        }
        
        LocalDate checkIn = LocalDate.parse(checkInStr, formatter);
        LocalDate checkOut = LocalDate.parse(checkOutStr, formatter);
        
        StayDAO dao = new StayDAO();
        int	res = dao.StayBookingCheck(sIdx, checkInStr, checkOutStr);

        if (res != 0) {
            int totalPrice = calculateTotalPrice(sIdx, checkIn, checkOut, price);
            request.setAttribute("sIdx", sIdx);
            request.setAttribute("checkIn", checkInStr);
            request.setAttribute("checkOut", checkOutStr);
            request.setAttribute("guestNum", guestNum);
            request.setAttribute("total", totalPrice);
            request.setAttribute("isBookingOk", true);
        } else {
            request.setAttribute("message", "예약이 불가능합니다.");
            request.setAttribute("url", "StayDetail.st?sIdx=" + sIdx);
            request.setAttribute("isBookingOk", false);
        }
	}
    private int calculateTotalPrice(int sIdx, LocalDate checkIn, LocalDate checkOut, int price) {
        long duration = ChronoUnit.DAYS.between(checkIn, checkOut);
        return price * (int) duration;
    }
}
