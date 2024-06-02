package memeber;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class MemberResetPwCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String newPw = request.getParameter("newPw")==null ? "" : request.getParameter("newPw");
		
		MemberDAO dao = new MemberDAO();
						
		String salt = UUID.randomUUID().toString().substring(0,8);
		
		SecurityUtil security = new SecurityUtil();
		newPw = security.encryptSHA256(salt + newPw);
		
		int res = dao.setMemberPwdChange(mid, (salt + newPw));
				
		response.getWriter().write(res + "");
	}

}
