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
		String bookingId = request.getParameter("bookingId");
		String part = request.getParameter("part") == null ? "" : request.getParameter("part");
		int partIdx = request.getParameter("partIdx") == null ? 0 : Integer.parseInt(request.getParameter("partIdx"));
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String nickName = (String) session.getAttribute("sNickName");
		int star = request.getParameter("star") == null ? 0 : Integer.parseInt(request.getParameter("star"));
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		String purpose = request.getParameter("purpose") == null ? "" : request.getParameter("purpose");
		
		AdminDAO dao = new AdminDAO();
		ReviewVO vo = new ReviewVO();

		vo.setPart(part);
		vo.setPartIdx(partIdx);
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setStar(star);
		vo.setContent(content);
		vo.setPurpose(purpose);
		
		int res = dao.setReviewInputOk(vo, bookingId);
		
		response.getWriter().write(res);
	}

}
