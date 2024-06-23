package blog;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BlogSearchCommand implements BlogInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword")==null ? "" : request.getParameter("keyword");

		BlogDAO dao = new BlogDAO();
		HttpSession session = request.getSession();
		String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
		
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 3 : Integer.parseInt(request.getParameter("pageSize"));
		int totRecCnt = dao.getTotRecCnt(mid, keyword);
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		
		ArrayList<BlogVO> vos = dao.getBlogSearch(startIndexNo, pageSize, keyword);
		
		if(vos.size() != 0) {
			request.setAttribute("searchMsg", keyword +" 에 맞는 게시글을 조회합니다.");
		}
		else {
			request.setAttribute("searchMsg", "검색어와 일치하는 게시글이 존재하지 않습니다.");
		}
        request.setAttribute("vos", vos);
        request.setAttribute("pag", pag);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("totRecCnt", totRecCnt);
        request.setAttribute("curScrStartNo", curScrStartNo);
	}
}
