package stay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StayDiscontinueCommand implements StayInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sIdx = request.getParameter("sIdx")==null ? 0 : Integer.parseInt(request.getParameter("sIdx"));
		
		StayDAO dao = new StayDAO();
		
		int res = dao.setStayDiscontinue(sIdx);
		
        if (res != 0) {
            response.getWriter().write("OK");
        } 
        else {
            response.getWriter().write("NO");
        }

	}

}
