package memeber;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberDeleteCheckOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		String salt = vo.getPwd().substring(0,8);
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt + pwd);
		
		if(!vo.getPwd().substring(8).equals(pwd)) {
			request.setAttribute("message", "비밀번호를 확인하세요.");
			request.setAttribute("url", "MemberPwdDeleteCheck.mem");
			return;
		}
		
		// 회원 탈퇴 신청 처리하기...(userDel필드를 'OK'로 변경처리)	
		int res = dao.setMemberDeleteUpdate(mid);
		
		if(res != 0) {
			session.invalidate();
			request.setAttribute("message", "회원 탈퇴 처리 되었습니다. 감사합니다.");
			request.setAttribute("url", request.getContextPath() + "/Main");
		}
		else {
			request.setAttribute("message", "회원 탈퇴 실패~~");
			request.setAttribute("url", "MemberMain.mem");
		}
	}

}
