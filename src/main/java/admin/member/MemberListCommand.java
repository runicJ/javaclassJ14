package admin.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.AdminDAO;
import admin.AdminInterface;
import common.Pagination;
import memeber.MemberDAO;
import memeber.MemberVO;

public class MemberListCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		String part = request.getParameter("part")==null ? "tIdx" : request.getParameter("part");
		
		if(mid.equals("admin")) {
			Pagination.pageChange(request, pag, pageSize, "", "memberList", part);
		}
		else {
			request.setAttribute("message", "관리자 전용 페이지 입니다. 로그인 페이지로 이동합니다.");
			request.setAttribute("url", "MemberLogin.mem");			
		}
	}

}
