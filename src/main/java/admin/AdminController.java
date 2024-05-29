package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.stay.StayListCommand;

@SuppressWarnings("serial")  // 필터 통과하고 제일 먼저 들어옴
@WebServlet("*.ad")  // 확장자 패턴으로
public class AdminController extends HttpServlet {  // 4
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;  // command 객체라서 변수명 이렇게 줌, 인터페이스이름 쓰고 마우스 올려서 interface create
		String viewPage = "/WEB-INF/admin";
		
		String com = request.getRequestURI();  // 식별자(uri), url(도메인까지 나옴) // 잘라내기 위해 com 변수 저장
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));  // +1 안하고 24번줄 "/" 넣어둠, +1 하면 ""
		
		// 인증....처리......
		HttpSession session = request.getSession();  // 세션을 열음
		String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
		
//		if(com.equals("/BoardComplaintInput")) {
//			command = new BoardComplaintInputCommand();
//			command.execute(request, response);
//			return;
//		}
//		else if(com.equals("/ReviewInputOk")) {
//			command = new ReviewInputOkCommand();
//			command.execute(request, response);
//			return;
//		}
//		else if(com.equals("/ReviewDelete")) {
//			command = new ReviewDeleteCommand();
//			command.execute(request, response);
//			return;
//		}
//		else if(com.equals("/ReviewReplyInputOk")) {
//			command = new ReviewReplyInputOkCommand();
//			command.execute(request, response);
//			return;
//		}
		if(!mid.equals("admin")) {
			request.setAttribute("message", "로그인 후 사용하세요");
			request.setAttribute("url", "MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AdminMain")) {
			viewPage += "/adminMain.jsp";  // frameset을 부름
		}
//		else if(com.equals("/AdminContent")) {
//			command = new AdminContentCommand();
//			command.execute(request, response);
//			viewPage += "/adminContent.jsp";
//		}
//		else if(com.equals("/GuestList")) {
//			command = new GuestListCommand();
//			command.execute(request, response);
//			viewPage += "guest/guestList.jsp";
//		}
		else if(com.equals("/StayInput")) {
			viewPage += "/stay/stayInput.jsp";
		}
		else if(com.equals("/StayList")) {
			command = new StayListCommand();
			command.execute(request, response);
			viewPage += "/stay/memberList.jsp";
		}
//		else if(com.equals("/MemberLevelChange")) {
//			command = new MemberLevelChangeCommand();
//			command.execute(request, response);
//			return;  // ajax니까 return
//		}
//		else if(com.equals("/MemberDeleteOk")) {
//			command = new MemberDeleteOkCommand();
//			command.execute(request, response);
//			return;
//		}
//		else if(com.equals("/MemberLevelSelectCheck")) {
//			command = new MemberLevelSelectCheckCommand();
//			command.execute(request, response);
//			return;
//		}
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
//		else if(com.equals("/ComplaintList")) {
//			command = new ComplaintListCommand();
//			command.execute(request, response);
//			viewPage += "/complaint/complaintList.jsp";
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
