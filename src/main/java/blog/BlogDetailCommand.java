package blog;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BlogDetailCommand implements BlogInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tIdx = request.getParameter("tIdx")==null ? 0 : Integer.parseInt(request.getParameter("tIdx"));
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 1 : Integer.parseInt(request.getParameter("pageSize"));
		
		BlogDAO dao = new BlogDAO();
		
		BlogVO vo = dao.getBlogDetail(tIdx);
		
//		HttpSession session = request.getSession();
//		ArrayList<String> contentViewCnt = (ArrayList<String>) session.getAttribute("tContentIdx");
//		if(contentViewCnt == null) contentViewCnt = new ArrayList<String>();
//		String imsiContentViewCnt = "blog" + tIdx;
//		if(!contentViewCnt.contains(imsiContentViewCnt)) {
//			dao.setBlogViewCnt(tIdx);
//			contentViewCnt.add(imsiContentViewCnt);
//		}
//		session.setAttribute("tContentIdx", contentViewCnt);
//		
//		ArrayList<String> contentLiked = (ArrayList<String>) session.getAttribute("tContentLiked");
//	    if(contentLiked == null) contentLiked = new ArrayList<String>();
//	    String imsiContentLiked = "blogLiked" + tIdx;
//	    
//	    String liked = "1";
//	    if(!contentLiked.contains(imsiContentLiked)) {
//	    	liked = "0";
//	    }
//	    request.setAttribute("liked", liked);
		
		request.setAttribute("vo", vo);
		
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
	}

}
