package stay;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.st")
public class StayController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StayInterface command = null;
		String viewPage = "/WEB-INF/stay";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		String sMid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");

		if(com.equals("/Introduce")) {
			command = new StayDetailCommand();
			command.execute(request, response);
			viewPage += "/introduce.jsp";
		}
		else if(com.equals("/StayList")) {
			command = new StayListCommand();
			command.execute(request, response);
			viewPage += "/stayList.jsp";
		}
		else if(com.equals("/ScrollPage")) {
			command = new StayListCommand();
			command.execute(request, response);
			viewPage += "/scrollPage.jsp";
		}
		else if(com.equals("/StayDetail")) {
			command = new StayDetailCommand();
			command.execute(request, response);
			viewPage += "/stayDetail.jsp";
		}
		else if(sMid == null || sMid.equals("")) {
			request.setAttribute("message", "로그인 후에 가능하신 메뉴입니다.");
			request.setAttribute("url", "MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/StayBooking")) {
			command = new StayBookingCommand();
			command.execute(request, response);
			viewPage = "/stayDetail.jsp";
		}
		else if(com.equals("/StayBookingOk")) {
			command = new StayBookingOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/StayWishToggle")) {
			command = new StayWishToggleCommand();
			command.execute(request, response);
			return;
		}
		else if(!sMid.equals("admin")) {
			request.setAttribute("message", "관리자 로그인 후에 가능하신 메뉴입니다.");
			request.setAttribute("url", "MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/StayInput")) {
			viewPage += "/stayInput.jsp";
		}
		else if(com.equals("/StayInputOk")) {
			command = new StayInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/StayUpdate")) {
			command = new StayUpdateCommand();
			command.execute(request, response);
			viewPage += "/stayUpdate.jsp";
		}
		else if(com.equals("/StayUpdateOk")) {
			command = new StayUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/StayDiscontinue")) {
			command = new StayDiscontinueCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
