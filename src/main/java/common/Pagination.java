package common;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import admin.AdminDAO;
import blog.BlogDAO;
import blog.BlogVO;
import memeber.MemberVO;

public class Pagination {

	public static void pageChange(HttpServletRequest request, int pag, int pageSize, String contentsShow, String section, String part) {
		BlogDAO blogDao = new BlogDAO();
		AdminDAO adminDao = new AdminDAO();
		
		int totRecCnt = 0;

		if(section.equals("blog")) {
			totRecCnt = blogDao.getTotRecCnt(contentsShow, part);
		}
		if(section.equals("MemberList")) {
			totRecCnt = blogDao.getTotRecCnt(contentsShow, part);
		}
		
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1;
		if(pag > totPage) pag = 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;

		ArrayList<BlogVO> bVos = null;
		ArrayList<MemberVO> mVos = null;

		if(section.equals("blog")) {
			bVos = blogDao.getBlogList(startIndexNo, pageSize, part);
			request.setAttribute("vos", bVos);
			
            ArrayList<BlogVO> sortCounts = blogDao.getSortCntAll();
            request.setAttribute("sortCounts", sortCounts);
		}
		if(section.equals("MemberList")) {
			mVos = adminDao.getMemberList(startIndexNo, pageSize, part);
			request.setAttribute("vos", mVos);
			
			ArrayList<BlogVO> sortCounts = blogDao.getSortCntAll();
			request.setAttribute("sortCounts", sortCounts);
		}
				
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totRecCnt", totRecCnt);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
				
		if(section.equals("blog")) {
			request.setAttribute("part", part);
		}
		if(section.equals("MemberList")) {
			request.setAttribute("part", part);
		}
	}

}
