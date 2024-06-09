package admin.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminDAO;
import admin.AdminInterface;

public class ReviewInputOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part = request.getParameter("part")==null ? "" : request.getParameter("part");
		int partIdx = request.getParameter("partIdx")==null ? 0 : Integer.parseInt(request.getParameter("partIdx"));
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		int star = request.getParameter("star")==null ? 0 : Integer.parseInt(request.getParameter("star"));
		String rContent = request.getParameter("rContent")==null ? "" : request.getParameter("rContent");
		String purpose = request.getParameter("purpose")==null ? "" : request.getParameter("purpose");
		
		AdminDAO dao = new AdminDAO();
		ReviewVO vo = new ReviewVO();

		vo.setPart(part);
		vo.setPartIdx(partIdx);
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setStar(star);
		vo.setContent(rContent);
		vo.setPurpose(purpose);
		
		int res = dao.setReviewInputOk(vo);
		
		response.getWriter().write(res);
	}

}
