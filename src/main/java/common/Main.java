package common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.AdminDAO;
import admin.review.ReviewVO;
import blog.BlogDAO;
import blog.BlogVO;
import stay.StayDAO;
import stay.StayVO;

@SuppressWarnings("serial")
@WebServlet("/Main")
public class Main extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sMid = (String) session.getAttribute("sMid");
		String contentsShow = "";
		if (sMid == null) {
			contentsShow = "guest";
		} else if (sMid.equals("admin")) {
			contentsShow = "adminOK";
		} else {
			contentsShow = sMid;
		}
		
		StayDAO dao = new StayDAO();
		ArrayList<StayVO> stayVos = dao.getVestFourStay(contentsShow);
		
        AdminDAO adminDao = new AdminDAO();
        Map<StayVO, Double> stayReviews = new HashMap<>();
        
        BlogDAO blogDao = new BlogDAO();
		ArrayList<BlogVO> blogVos = blogDao.getVestThreeBlog();
        
        for (StayVO stayVo : stayVos) {
            ArrayList<ReviewVO> reviews = adminDao.getReviewSearch(stayVo.getsIdx(), "stay");
            int totalStars = 0;
            for (ReviewVO review : reviews) {
                totalStars += review.getStar();
            }
           	double reviewAvg = reviews.size() > 0 ? (double) totalStars / reviews.size() : 0.0;
           	stayReviews.put(stayVo, reviewAvg);
        }
        
        request.setAttribute("stayVos", stayVos);
        request.setAttribute("blogVos", blogVos);
        request.setAttribute("stayReviews", stayReviews);
		
		String viewPage = "/main/main.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}