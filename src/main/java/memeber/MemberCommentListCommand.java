package memeber;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Pagination;

public class MemberCommentListCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		String part = request.getParameter("part")==null ? "tIdx" : request.getParameter("part");
		
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		Pagination.pageChange(request, pag, pageSize, mid, "blog", part);
	}
}
