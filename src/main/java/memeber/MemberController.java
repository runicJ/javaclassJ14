package memeber;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")  // 필터 통과하고 제일 먼저 들어옴
@WebServlet("*.mem")  // 확장자 패턴으로
public class MemberController extends HttpServlet {  // 4
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;  // command 객체라서 변수명 이렇게 줌, 인터페이스이름 쓰고 마우스 올려서 interface create
		String viewPage = "/WEB-INF/member";
		
		String com = request.getRequestURI();  // 식별자(uri), url(도메인까지 나옴) // 잘라내기 위해 com 변수 저장
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));  // +1 안하고 24번줄 "/" 넣어둠, +1 하면 ""
		
		// 인증....처리......
		HttpSession session = request.getSession();  // 세션을 열음
		String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");  // int 담아서 밑에서 크고작고 비교 가능 // level 그릇에 비로그인 시 등급이 없으면 999 부여  // 로그인 안했는데 .mem으로 왔으니 쫓아 버려야
		
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
		else if(mid.equals("")) {
			request.setAttribute("message", "로그인 후 사용하세요");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberMain")) {  // 로그인하면 필요한걸 다 담아서 memberMain으로 보냄
			command = new MemberMainCommand();  // 경로명, 클래스명 대문자
			command.execute(request, response);
			viewPage += "/memberMain.jsp";  // jsp는 소문자
		}
		else if(com.equals("/MemberList")) {
			command = new MemberListCommand();
			command.execute(request, response);
			viewPage += "/memberList.jsp";
		}
		else if(com.equals("/MemberSearch")) {
			command = new MemberSearchCommand();
			command.execute(request, response);
			viewPage += "/memberSearch.jsp";
		}
		else if(com.equals("/MemberPwdCheck")) {  // 화면만 띄우는 거니까 내용 가져올 필요없음 command
			viewPage += "/memberPwdCheck.jsp";
		}
		else if(com.equals("/MemberPwdCheckAjax")) {
			command = new MemberPwdCheckAjaxCommand();
			command.execute(request, response);
			return;  // ajax는 viewPage가 필요없으므로 return
		}
		else if(com.equals("/MemberPwdChangeCheck")) {
			command = new MemberPwdChangeCheckCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";  // 비밀번호가 변경되었습니다. 메시지 보내야함
		}
		else if(com.equals("/MemberPwdCheckOk")) {
			command = new MemberPwdCheckOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberUpdate")) {
			command = new MemberUpdateCommand();
			command.execute(request, response);
			viewPage += "/memberUpdate.jsp";  // view를 가져가야함(회원 수정창에 해당 회원의 모든 정보를 넣어서 보여줌)
		}
		else if(com.equals("/MemberUpdateOk")) {
			command = new MemberUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberDelete")) {
			viewPage += "/memberPwdDeleteCheck.jsp";
		}
		else if(com.equals("/MemberDeleteCheckOk")) {
			command = new MemberDeleteCheckOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";  // 메시지로 보내는게 맞겠죠
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
