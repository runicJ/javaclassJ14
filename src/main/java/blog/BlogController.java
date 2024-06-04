package blog;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")  // 필터 통과하고 제일 먼저 들어옴
@WebServlet("*.bl")  // 확장자 패턴으로
public class BlogController extends HttpServlet {  // 4
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BlogInterface command = null;  // command 객체라서 변수명 이렇게 줌, 인터페이스이름 쓰고 마우스 올려서 interface create
		String viewPage = "/WEB-INF/blog";
		
		String com = request.getRequestURI();  // 식별자(uri), url(도메인까지 나옴) // 잘라내기 위해 com 변수 저장
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));  // +1 안하고 24번줄 "/" 넣어둠, +1 하면 ""
		
		// 인증....처리......
		HttpSession session = request.getSession();  // 세션을 열음
		String sMid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");

		if(com.equals("/BlogList")) {
			command = new BlogListCommand();
			command.execute(request, response);
			viewPage += "/blogList.jsp";
		}
		else if(com.equals("/BlogJournalList")) {
			//command = new BlogListCommand();
			//command.execute(request, response);
			viewPage += "/blogJournalList.jsp";
		}
		else if(sMid.equals("")) {
			request.setAttribute("message", "로그인 후 사용하세요");
			request.setAttribute("url", "MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/BlogInput")) {
			viewPage += "/blogInput.jsp";
		}
		else if(com.equals("/BlogInputOk")) {
			command = new BlogInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/BlogDetail")) {
			command = new BlogDetailCommand();
			command.execute(request, response);
			viewPage += "/blogDetail.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
