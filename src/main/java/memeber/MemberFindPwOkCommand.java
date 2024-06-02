package memeber;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFindPwOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	    String name = request.getParameter("name")==null ? "" : request.getParameter("name");
	    String tel = request.getParameter("tel")==null ? "" : request.getParameter("tel");
	    
	    MemberDAO dao = new MemberDAO();
	    
	    int res = dao.getMemberFindPw(mid, name, tel);
	    response.getWriter().write(res + "");
	}

}
