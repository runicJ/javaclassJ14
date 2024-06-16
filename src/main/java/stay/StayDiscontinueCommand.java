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
		
		if(res != 0) {
			request.setAttribute("message", "숙소 게시글이 중지 처리되었습니다.");
			request.setAttribute("url", "StayList.st");
		}
		else {
			request.setAttribute("message", "비공개 처리 실패");
			request.setAttribute("url", "StayDetail.st?sIdx=" + sIdx);
		}

	}

}
