package stay;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StayListCommand implements StayInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sMid = (String) session.getAttribute("sMid");
		String contentsShow = "";
		if(sMid.equals("admin")) contentsShow = "adminOK";
		else contentsShow = (String) session.getAttribute("sMid");
		
		StayDAO dao = new StayDAO();
		
		ArrayList<StayVO> vos = dao.getStayList(contentsShow);
		
		request.setAttribute("vos", vos);
	}

}
