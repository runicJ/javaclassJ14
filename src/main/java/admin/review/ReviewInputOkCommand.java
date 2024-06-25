package admin.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.AdminDAO;
import admin.AdminInterface;

public class ReviewInputOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int bIdx = request.getParameter("bookingId")== null ? 0 : Integer.parseInt(request.getParameter("bookingId"));
		String part = request.getParameter("part") == null ? "" : request.getParameter("part");
		int partIdx = request.getParameter("partIdx") == null ? 0 : Integer.parseInt(request.getParameter("partIdx"));
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String nickName = (String) session.getAttribute("sNickName");
		int star = request.getParameter("star") == null ? 0 : Integer.parseInt(request.getParameter("star"));
		String rContent = request.getParameter("review") == null ? "" : request.getParameter("review");
		String purpose = request.getParameter("purpose") == null ? "" : request.getParameter("purpose");
		
		AdminDAO dao = new AdminDAO();
		ReviewVO vo = new ReviewVO();

		vo.setPart(part);
		vo.setPartIdx(partIdx);
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setStar(star);
		vo.setrContent(rContent);
		vo.setPurpose(purpose);
		vo.setbIdx(bIdx);
		
		int res = dao.setReviewInputOk(vo);
		
		response.getWriter().write(res);
	}

}
