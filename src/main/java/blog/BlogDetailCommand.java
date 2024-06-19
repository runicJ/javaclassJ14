package blog;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.AdminDAO;
import admin.review.ReviewVO;
import memeber.MemberDAO;
import memeber.MemberVO;

public class BlogDetailCommand implements BlogInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tIdx = request.getParameter("tIdx")==null ? 0 : Integer.parseInt(request.getParameter("tIdx"));
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 1 : Integer.parseInt(request.getParameter("pageSize"));
		
		BlogDAO dao = new BlogDAO();
		
		BlogVO vo = dao.getBlogDetail(tIdx);
		
		// 이전글/다음글 처리
		BlogVO preVo = dao.getPreNextSearch(tIdx, "preVo");  // preVo 값을 준 것 얘가 있으면 이전글  // 하나로 dao에서 처리하기 위해
		BlogVO nextVo = dao.getPreNextSearch(tIdx, "nextVo");  // 같은 메소드 써도 된다는 것
		request.setAttribute("preVo", preVo);
		request.setAttribute("nextVo", nextVo);
		
		ArrayList<BlogVO> bVos = dao.getVestThreeBlog();
		request.setAttribute("bVos", bVos);
		
		MemberDAO memDao = new MemberDAO();
		MemberVO memVo = memDao.getMemberIdCheck(vo.getMid());
		
		request.setAttribute("memVo", memVo);
		
		AdminDAO adDao = new AdminDAO();
		ArrayList<ReviewVO> rVos = adDao.getReviewSearch(tIdx, "travelog");
		
		request.setAttribute("rVos", rVos);
		
		HttpSession session = request.getSession();
		ArrayList<String> contentViewCnt = (ArrayList<String>) session.getAttribute("tContentIdx");
		if(contentViewCnt == null) contentViewCnt = new ArrayList<String>();
		String imsiContentViewCnt = "blog" + tIdx;
		if(!contentViewCnt.contains(imsiContentViewCnt)) {
			dao.setBlogViewCnt(tIdx);
			contentViewCnt.add(imsiContentViewCnt);
		}
		session.setAttribute("tContentIdx", contentViewCnt);
		
        ArrayList<BlogVO> sortCounts = dao.getSortCntAll();
        request.setAttribute("sortCounts", sortCounts);
		
		request.setAttribute("vo", vo);
		
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
	}

}
