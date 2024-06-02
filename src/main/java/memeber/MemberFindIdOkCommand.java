package memeber;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFindIdOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
	    String tel = request.getParameter("tel")==null ? "" : request.getParameter("tel");
	    
	    MemberDAO dao = new MemberDAO();
	    
	    MemberVO vo = dao.getMemberFindId(name, tel);
	    
	    if (vo.getMid() != null) {
	        String str = "";
	        int length = vo.getMid().length();
	        int midCount = 4;
	        if (length <= 5) midCount = 2;

	        String viewMid = vo.getMid().substring(0, midCount);
	        String maskedMid = "*".repeat(length - midCount);
	        String joinDate = "(가입일 : " + vo.getStartDate().substring(0,10) + ")";

	        str = viewMid + maskedMid + joinDate;
	        response.getWriter().write(str);
	    } 
	    else {
	        response.getWriter().write("해당 정보로 등록된 아이디가 없습니다.");
	    }
	}

}
