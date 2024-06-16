package memeber;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.mem")
public class MemberController extends HttpServlet {  // 4
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPage = "/WEB-INF/member";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		String sMid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
		
		if(com.equals("/MemberLogin")) {
			viewPage += "/memberLogin.jsp";
		}
		else if(com.equals("/MemberLoginOk")) {
			command = new MemberLoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberFindIdPw")) {
			viewPage += "/memberFindIdPw.jsp";
		}
		else if(com.equals("/MemberFindIdOk")) {
			command = new MemberFindIdOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberFindPwOk")) {
			command = new MemberFindPwOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberResetPw")) {
			command = new MemberResetPwCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberLogout")) {
			command = new MemberLogoutCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberAgreeJoin")) {
			viewPage += "/memberAgreeJoin.jsp";
		}
		else if(com.equals("/MemberJoin")) {
			viewPage += "/memberJoin.jsp";
		}
		else if(com.equals("/MemberJoinOk")) {
			command = new MemberJoinOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberIdCheck")) {
			command = new MemberIdCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberNickCheck")) {
			command = new MemberNickCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberTelCheck")) {
			command = new MemberTelCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(sMid == null || sMid.equals("")) {
			request.setAttribute("message", "로그인 후 사용하세요");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberMain")) {
			command = new MemberMainCommand();
			command.execute(request, response);
			viewPage += "/memberMain.jsp";
		}
		else if(com.equals("/MemberPwdCheck")) {
			viewPage += "/memberPwdCheck.jsp";
		}
		else if(com.equals("/MemberPwdCheckOk")) {
			command = new MemberPwdCheckOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberUpdate")) {
			command = new MemberUpdateCommand();
			command.execute(request, response);
			viewPage += "/memberUpdate.jsp";
		}
		else if(com.equals("/MemberUpdateOk")) {
			command = new MemberUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberBookingList")) {
			command = new MemberBookingListCommand();
			command.execute(request, response);
			viewPage += "/memberBookingList.jsp";
		}
		else if(com.equals("/MemberCommentList")) {
			command = new MemberCommentListCommand();
			command.execute(request, response);
			viewPage += "/memberCommentList.jsp";
		}
		else if(com.equals("/MemberDelete")) {
			viewPage += "/memberPwdDeleteCheck.jsp";
		}
		else if(com.equals("/MemberDeleteCheckOk")) {
			command = new MemberDeleteCheckOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
