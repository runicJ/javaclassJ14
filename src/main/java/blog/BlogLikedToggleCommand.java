package blog;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import stay.StayDAO;

public class BlogLikedToggleCommand implements BlogInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int tIdx = request.getParameter("tIdx") == null ? 0 : Integer.parseInt(request.getParameter("tIdx"));
        
        HttpSession session = request.getSession();
        String sMid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
        
        BlogDAO dao = new BlogDAO();
        
        boolean likedExist = dao.checkMemberLiked(sMid, tIdx);
        
        if (!likedExist) {
            dao.toggleLiked(sMid, tIdx, true);
        } else {
            dao.toggleLiked(sMid, tIdx, false);
        }
        
        response.getWriter().write(likedExist ? "false" : "true");
	}

}
