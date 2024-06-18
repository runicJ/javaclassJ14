package blog;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Pagination;

public class BlogListCommand implements BlogInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		String part = request.getParameter("part")==null ? "tIdx" : request.getParameter("part");
		
		Pagination.pageChange(request, pag, pageSize, "", "blog", part);
		
		BlogDAO dao = new BlogDAO();
		
		ArrayList<BlogVO> gVos = dao.getNoticeList();
		request.setAttribute("gVos", gVos);
	}
}
