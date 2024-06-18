package blog;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BlogSearchCommand implements BlogInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword")==null ? "" : request.getParameter("keyword");
		
		BlogDAO dao = new BlogDAO();
		
		ArrayList<BlogVO> sVos = dao.getBlogSearch(keyword);
		
		if(sVos.size() != 0) {
			request.setAttribute("message", "검색어에 맞는 게시글을 조회합니다.");
			request.setAttribute("url", "BlogList.bl?sVos=" + sVos);
		}
		else {
			request.setAttribute("message", "검색어와 일치하는 게시글이 존재하지 않습니다.");
			request.setAttribute("url", "BlogList.bl");
		}
	}
}
