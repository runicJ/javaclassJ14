package stay;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class StayInputOkCommand implements StayInterface {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/stay");  // 경로 마지막 / 안붙여도 됨
		int maxSize = 1024 * 1024 * 30;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String sort = multipartRequest.getParameter("sort")==null ? "" : multipartRequest.getParameter("sort");
		String sName = multipartRequest.getParameter("sName")==null ? "" : multipartRequest.getParameter("sName");
		String address = multipartRequest.getParameter("address")==null ? "" : multipartRequest.getParameter("address");
		String sContent = multipartRequest.getParameter("sContent")==null ? "" : multipartRequest.getParameter("sContent");
		String residence = multipartRequest.getParameter("residence")==null ? "" : multipartRequest.getParameter("residence");
		int guestMax = multipartRequest.getParameter("guestMax")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("guestMax"));
		int price = multipartRequest.getParameter("price")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("price"));
		int bed = multipartRequest.getParameter("bed")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("bed"));
		int toilet = multipartRequest.getParameter("toilet")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("toilet"));
		String sPhoto = multipartRequest.getFilesystemName("fName")==null ? "noImage.jpg" : multipartRequest.getFilesystemName("fName");  // getParameter 앞에서 저장된 이름 -불러온 이름으로 db에 저장하면 의미x // 서버에 저장된 파일시스템 이름으로 저장해야함(똑같은 10.jpg가 있으면 101.jpg로 저장됨 => db에 10.jpg로 저장하면 의미없음, 실제로 저장된 101.jpg로 db에 저장해야함 
		
		String[] filters = multipartRequest.getParameterValues("filter");  // 같은 이름이 여러개니까 값이 오던 안오던 배열로 처리
		
		StayDAO dao = new StayDAO();
		
		//List<filterVO> vo = dao.setStayFilter(List<StringBuilder> filters);
		
	}

}
