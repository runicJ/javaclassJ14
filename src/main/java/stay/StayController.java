package stay;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")  // 필터 통과하고 제일 먼저 들어옴
@WebServlet("*.st")  // 확장자 패턴으로
public class StayController extends HttpServlet {  // 4
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StayInterface command = null;  // command 객체라서 변수명 이렇게 줌, 인터페이스이름 쓰고 마우스 올려서 interface create
		String viewPage = "/WEB-INF/stay";
		
		String com = request.getRequestURI();  // 식별자(uri), url(도메인까지 나옴) // 잘라내기 위해 com 변수 저장
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));  // +1 안하고 24번줄 "/" 넣어둠, +1 하면 ""
		
		// 인증....처리......
		HttpSession session = request.getSession();  // 세션을 열음
		String sMid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");  // int 담아서 밑에서 크고작고 비교 가능 // level 그릇에 비로그인 시 등급이 없으면 999 부여  // 로그인 안했는데 .mem으로 왔으니 쫓아 버려야

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
		else if(com.equals("/StayDetail")) {
			command = new StayDetailCommand();
			command.execute(request, response);
			viewPage += "/stayDetail.jsp";
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
		else if(com.equals("/StayWishToggle")) {
			command = new StayWishToggleCommand();
			command.execute(request, response);
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
