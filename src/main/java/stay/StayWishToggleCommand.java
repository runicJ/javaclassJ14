package stay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StayWishToggleCommand implements StayInterface {

	@Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sIdx = request.getParameter("sIdx") == null ? 0 : Integer.parseInt(request.getParameter("sIdx"));
        String mid = (String) request.getSession().getAttribute("sMid");
        
        StayDAO dao = new StayDAO();
        
        boolean wishExist = dao.checkMemberWish(mid, sIdx);
        
        if (!wishExist) {
            dao.toggleWish(mid, sIdx, true);
        } else {
            dao.toggleWish(mid, sIdx, false);
        }
        
        response.getWriter().write(wishExist ? "true" : "false");
	}
}
