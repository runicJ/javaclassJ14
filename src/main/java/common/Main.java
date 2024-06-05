package common;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stay.StayDAO;
import stay.StayVO;

//import study.database.LoginDAO;
//import study.database.LoginVO;

@SuppressWarnings("serial")
@WebServlet("/Main")
public class Main extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//LoginDAO dao = new LoginDAO();
		
		//ArrayList<LoginVO> recentVos = dao.getRecentFiveMember();
		
		//request.setAttribute("recentVos", recentVos);
		
		StayDAO dao = new StayDAO();
		ArrayList<StayVO> vestVos = dao.getVestFourStay();
		
		request.setAttribute("vestVos", vestVos);
		
		String viewPage = "/main/main.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}