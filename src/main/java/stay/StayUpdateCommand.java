package stay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.BlogDAO;
import blog.BlogVO;

public class StayUpdateCommand implements StayInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sIdx = request.getParameter("sIdx")==null ? 0 : Integer.parseInt(request.getParameter("sIdx"));
		
		StayDAO dao = new StayDAO();
		StayVO vo = dao.getStayIdxDetail(sIdx);
		
		request.setAttribute("vo", vo);
	}

}
