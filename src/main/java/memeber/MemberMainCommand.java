package memeber;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.review.ReviewVO;
import blog.BlogVO;

public class MemberMainCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberIdCheck(mid);
	
		ArrayList<BlogVO> tVos = dao.getMemberBlogList(mid);
		
		ArrayList<ReviewVO> rVos = dao.getMemberReviews(mid);		
		
		request.setAttribute("vo", vo);
		request.setAttribute("tVos", tVos);
		request.setAttribute("rVos", rVos);
	}

}
