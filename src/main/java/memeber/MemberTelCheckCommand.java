package memeber;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberTelCheckCommand implements MemberInterface {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tel = request.getParameter("tel")==null ? "" : request.getParameter("tel");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberTelCheck(tel);
		
		String str = "0";
		if(vo.getMid() != null) str = "1";
		
		response.getWriter().write(str);
	}

}
