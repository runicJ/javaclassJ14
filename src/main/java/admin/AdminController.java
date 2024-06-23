package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.complaint.BlogComplaintAnswerCommand;
import admin.complaint.ComplaintListCommand;
import admin.member.MemberDeleteOkCommand;
import admin.member.MemberListCommand;
import admin.review.ReviewDeleteCommand;
import admin.review.ReviewInputOkCommand;
import admin.stay.StayListCommand;

@SuppressWarnings("serial")
@WebServlet("*.ad")
public class AdminController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;
		String viewPage = "/WEB-INF/admin";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
		
		if(com.equals("/BlogComplaintAnswer")) {
			command = new BlogComplaintAnswerCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ReviewInputOk")) {
			command = new ReviewInputOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ReviewDelete")) {
			command = new ReviewDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ActivityBooking")) {
			viewPage += "/error.jsp";
		}
		else if(com.equals("/MemberMessage")) {
			viewPage += "/error.jsp";
		}
		else if(com.equals("/FAQList")) {
			viewPage += "/complaint/faqList.jsp";
		}
		else if(com.equals("/ComplaintInput")) {
			viewPage += "/complaint/complaintInput.jsp";
		}
		else if(!mid.equals("admin")) {
			request.setAttribute("message", "로그인 후 사용하세요");
			request.setAttribute("url", "MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AdminMain")) {
			viewPage += "/adminMain.jsp";
		}
		else if(com.equals("/StayInput")) {
			viewPage += "/stay/stayInput.jsp";
		}
//		else if(com.equals("/StayInputOk")) {
//			command = new StayInputOkCommand();
//			command.execute(request, response);
//			viewPage = "/include/message.jsp";
//		}
		else if(com.equals("/StayList")) {
			command = new StayListCommand();
			command.execute(request, response);
			viewPage += "/stay/stayList.jsp";
		}
		else if(com.equals("/MemberList")) {
			command = new MemberListCommand();
			command.execute(request, response);
			viewPage += "/member/memberList.jsp";
		}
		else if(com.equals("/MemberDeleteOk")) {
			command = new MemberDeleteOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ComplaintList")) {
			command = new ComplaintListCommand();
			command.execute(request, response);
			viewPage += "/complaint/complaintList.jsp";
		}
//		else if(com.equals("/BoardList")) {
//			command = new BoardListCommand();
//			command.execute(request, response);
//			viewPage += "/board/boardList.jsp";
//		}
//		else if(com.equals("/BoardContent")) {
//			command = new BoardContentCommand();
//			command.execute(request, response);
//			viewPage += "/board/boardContent.jsp";
//		}
//		else if(com.equals("/ComplaintCheck")) {
//			command = new ComplaintCheckCommand();
//			command.execute(request, response);
//			return;
//		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
