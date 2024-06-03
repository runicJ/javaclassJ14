package stay;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
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
		
		String[] filters = multipartRequest.getParameterValues("filter");
		
		StayDAO dao = new StayDAO();
	    try {
	        // DB 연결 및 트랜잭션 시작
	        dao.startTransaction();
	        
			StayVO vo = new StayVO();
			vo.setSort(sort);
			vo.setsName(sName);
			vo.setAddress(address);
			vo.setsContent(sContent);
			vo.setResidence(residence);
			vo.setGuestMax(guestMax);
			vo.setPrice(price);

			int res = dao.setStayInputOk(vo); // 숙소 정보 저장
	        if (res == 0) throw new SQLException("숙소 등록 실패");
	        
	        FilterVO fVo = new FilterVO();
	        boolean wifi = false, ac = false, parking = false, pet = false, kitchen = false, washing = false;

		    if (filters != null) {
		        for (String filter : filters) {
		            if (filter.equals("Wi-Fi")) wifi = true;
		            if (filter.equals("에어컨")) ac = true;
		            if (filter.equals("주차장")) parking = true;
		            if (filter.equals("반려동물 동반")) pet = true;
		            if (filter.equals("부엌")) kitchen = true;
		            if (filter.equals("세탁기")) washing = true;
		        }
		    }
		    
			fVo.setBed(bed);
			fVo.setToilet(toilet);
			fVo.setWifi(wifi);
			fVo.setAc(ac);
			fVo.setParking(parking);
			fVo.setPet(pet);
			fVo.setKitchen(kitchen);
			fVo.setWashing(washing);
			fVo.setsIdx(vo.getsIdx());
			
			dao.setStayFilter(fVo);  // 필터 정보 저장
		
		    // 모든 작업 성공
	        dao.commit(); // 성공 시 커밋
	        request.setAttribute("message", "숙소가 등록되었습니다.");
	    } catch (Exception e) {
	        dao.rollback(); // 실패 시 롤백
	        request.setAttribute("message", "숙소 등록 실패: " + e.getMessage());
	    } finally {
	        // DAO 연결 종료
	        dao.connClose();
	        // 응답 페이지로 포워드
	        RequestDispatcher dispatcher = request.getRequestDispatcher("StayList.jsp");
	        dispatcher.forward(request, response);
	    }
	}

}
