package blog;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.bl")
public class BlogController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BlogInterface command = null;
		String viewPage = "/WEB-INF/blog";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		// 인증....처리......
		HttpSession session = request.getSession();
		String sMid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");

		if(com.equals("/BlogList")) {
			command = new BlogListCommand();
			command.execute(request, response);
			viewPage += "/blogList.jsp";
		}
		else if(com.equals("/BlogJournal")) {
			viewPage += "/blogJournal.jsp";
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
		else if(com.equals("/BlogUpdate")) {
			command = new BlogUpdateCommand();
			command.execute(request, response);
			viewPage += "/blogUpdate.jsp";
		}
		else if(com.equals("/BlogUpdateOk")) {
			command = new BlogUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/BlogDetail")) {
			command = new BlogDetailCommand();
			command.execute(request, response);
			viewPage += "/blogDetail.jsp";
		}
		else if(com.equals("/BlogDeleteCheck")) {
			command = new BlogDeleteCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/BlogLikedToggle")) {
			command = new BlogLikedToggleCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/BlogSearch")) {
			command = new BlogSearchCommand();
			command.execute(request, response);
			viewPage += "/blogList.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
