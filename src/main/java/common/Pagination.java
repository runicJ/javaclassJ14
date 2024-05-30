package common;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import blog.BlogDAO;
import blog.BlogVO;

public class Pagination {

	public static void pageChange(HttpServletRequest request, int pag, int pageSize, String contentsShow, String section, String part) {  // 관리자는 adminOK 아니면 일반사용자(contentShow) // 항상 쓰는 것이니까 static 붙여줌  // part는 자료실에서 쓰일 것
		BlogDAO blogDao = new BlogDAO();
	
		int totRecCnt = 0;

		if(section.equals("blog")) {
			totRecCnt = blogDao.getTotRecCnt();  // 자료실의 전체 레코드 수 구하기
		}
		
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1;
		if(pag > totPage) pag = 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;

		ArrayList<BlogVO> bVos = null;

		if(section.equals("blog")) {
			bVos = blogDao.getBlogList(startIndexNo, pageSize, contentsShow);	// 게시판의 전체 자료 가져오기
			request.setAttribute("vos", bVos);
		}
		
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totRecCnt", totRecCnt);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		
	}

}
