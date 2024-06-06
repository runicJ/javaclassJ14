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

import admin.AdminDAO;
import admin.review.ReviewVO;
import stay.StayDAO;
import stay.StayVO;

//import study.database.LoginDAO;
//import study.database.LoginVO;

@SuppressWarnings("serial")
@WebServlet("/Main")
public class Main extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		StayDAO dao = new StayDAO();
		ArrayList<StayVO> vestVos = dao.getVestFourStay();
		
        AdminDAO adminDao = new AdminDAO();
        Map<StayVO, Double> stayReviews = new HashMap<>();
        
        for (StayVO vestVo : vestVos) {
            ArrayList<ReviewVO> reviews = adminDao.getReviewSearch(vestVo.getsIdx(), "stay");
            int totalStars = 0;
            for (ReviewVO review : reviews) {
                totalStars += review.getStar();
            }
           	double reviewAvg = reviews.size() > 0 ? (double) totalStars / reviews.size() : 0.0;
           	stayReviews.put(vestVo, reviewAvg);
        }
        
        request.setAttribute("vestVos", vestVos);
        request.setAttribute("stayReviews", stayReviews);
		
		String viewPage = "/main/main.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}