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
        String checkInStr = request.getParameter("checkIn") == null ? "" : request.getParameter("checkIn");
        String checkOutStr = request.getParameter("checkOut") == null ? "" : request.getParameter("checkOut");
        int guestNum = request.getParameter("guestNum") == null ? 0 : Integer.parseInt(request.getParameter("guestNum"));
        int price = request.getParameter("price") == null ? 0 : Integer.parseInt(request.getParameter("price"));

        if (checkInStr.isEmpty() || checkOutStr.isEmpty()) {
            response.getWriter().write("BAD,예약하실 날짜를 입력해주세요!");
            return;
        }

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate checkIn = LocalDate.parse(checkInStr, formatter);
        LocalDate checkOut = LocalDate.parse(checkOutStr, formatter);

        StayDAO dao = new StayDAO();
        int res = dao.StayBookingCheck(sIdx, checkInStr, checkOut.minusDays(1).toString());

        if (res == 0) {
            int totalPrice = calcTotalPrice(checkIn, checkOut, price);
            response.getWriter().write("OK," + totalPrice);
        } 
        else {
            response.getWriter().write("NO,해당 날짜는 예약이 불가능합니다.");
        }        
    }

    private int calcTotalPrice(LocalDate checkIn, LocalDate checkOut, int price) {
        long period = ChronoUnit.DAYS.between(checkIn, checkOut);
        return price * (int) period;
    }
}
