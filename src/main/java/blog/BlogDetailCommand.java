package blog;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BlogDetailCommand implements BlogInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tIdx = request.getParameter("tIdx")==null ? 0 : Integer.parseInt(request.getParameter("tIdx"));
		
		BlogDAO dao = new BlogDAO();
		
		BlogVO vo = dao.getBlogDetail(tIdx);
		
		request.setAttribute("vo", vo);
	}

}
