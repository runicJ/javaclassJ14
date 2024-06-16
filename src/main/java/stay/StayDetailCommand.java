package stay;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.AdminDAO;
import admin.review.ReviewVO;

public class StayDetailCommand implements StayInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sIdx = request.getParameter("sIdx")==null ? 0 : Integer.parseInt(request.getParameter("sIdx"));
		//String part = request.getParameter("part")==null ? "" : request.getParameter("part");
		
		HttpSession session = request.getSession();
		String sMid = (String) session.getAttribute("sMid");
		String contentsShow = "";
		if (sMid == null) {
			contentsShow = "guest";
		} 
		else if (sMid.equals("admin")) {
			contentsShow = "adminOK";
		} 
		else {
			contentsShow = sMid;
		}
		
		StayDAO dao = new StayDAO();
		
		StayVO vo = dao.getStayIdxDetail(sIdx, contentsShow);
		FacilityVO fVo = dao.getStayIdxFacility(sIdx);
		
		// 해당글의 리뷰내용 가져오기
		AdminDAO aDao = new AdminDAO();
		ArrayList<ReviewVO> rVos = aDao.getReviewSearch(sIdx, "stay");
		
		// 별점 평균 구하기
		int reviewTot = 0;
		for(ReviewVO r : rVos) {
			reviewTot += r.getStar();
		}
		double reviewAvg = 0.0;  // 소수점 아래 double
		if(rVos.size() != 0) reviewAvg = (double) reviewTot / rVos.size();
		
		request.setAttribute("vo", vo);
		request.setAttribute("fVo", fVo);
		//request.setAttribute("part", part);
		request.setAttribute("rVos", rVos);
		request.setAttribute("reviewAvg", reviewAvg);
	}

}
