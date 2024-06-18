package stay;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class StayInputOkCommand implements StayInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/stay");
		int maxSize = 1024 * 1024 * 30;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		Enumeration fileNames = multipartRequest.getFileNames();
		
		String file = "";
		String oFileName = "";
		
		while(fileNames.hasMoreElements()) {  // 하나씩 꺼내서 값이 있느냐
			file = (String) fileNames.nextElement();
			
			if(multipartRequest.getFilesystemName(file) != null) {
				oFileName += multipartRequest.getOriginalFileName(file) + "/";
			}
		}
        oFileName = oFileName.substring(0, oFileName.lastIndexOf("/"));
		
		String sort = multipartRequest.getParameter("sort")==null ? "" : multipartRequest.getParameter("sort");
		String sName = multipartRequest.getParameter("sName")==null ? "" : multipartRequest.getParameter("sName");
		String address = multipartRequest.getParameter("address")==null ? "" : multipartRequest.getParameter("address");
		String sContent = multipartRequest.getParameter("sContent")==null ? "" : multipartRequest.getParameter("sContent");
		String residence = multipartRequest.getParameter("residence")==null ? "" : multipartRequest.getParameter("residence");
		int guestMax = multipartRequest.getParameter("guestMax")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("guestMax"));
		int price = multipartRequest.getParameter("price")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("price"));
		int bed = multipartRequest.getParameter("bed")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("bed"));
		int toilet = multipartRequest.getParameter("toilet")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("toilet"));				
		
		StayDAO dao = new StayDAO();
	        
		StayVO vo = new StayVO();
		vo.setSort(sort);
		vo.setsName(sName);
		vo.setsPhoto(oFileName);
		vo.setAddress(address);
		vo.setsContent(sContent);
		vo.setResidence(residence);
		vo.setGuestMax(guestMax);
		vo.setPrice(price);
        
		String[] facilities = multipartRequest.getParameterValues("facility");
		String wifi = "NO", ac = "NO", parking = "NO", pet = "NO", kitchen = "NO", washing = "NO";

		if (facilities != null) {
		    for (String facility : facilities) {
		        if (facility.equals("wifi")) wifi = "OK";
		        if (facility.equals("ac")) ac = "OK";
		        if (facility.equals("parking")) parking = "OK";
		        if (facility.equals("pet")) pet = "OK";
		        if (facility.equals("kitchen")) kitchen = "OK";
		        if (facility.equals("washing")) washing = "OK";
		    }
		}

		FacilityVO fVo = new FacilityVO();
		fVo.setBed(bed);
		fVo.setToilet(toilet);
		fVo.setWifi(wifi);
		fVo.setAc(ac);
		fVo.setParking(parking);
		fVo.setPet(pet);
		fVo.setKitchen(kitchen);
		fVo.setWashing(washing);

		Map<String, Object> result = dao.setStayInputOk(vo, fVo); // 숙소 정보 저장
        if (result == null) {
            request.setAttribute("message", "숙소 등록 실패");
            request.setAttribute("url", "StayInput.st");
        } else {
            int res = (int) result.get("res");
            int sIdx = (int) result.get("sIdx");
            
            if (res != 0) {
                request.setAttribute("message", "숙소가 등록되었습니다.");
                request.setAttribute("url", "StayList.st");
            } else {
                request.setAttribute("message", "숙소 등록 실패");
                request.setAttribute("url", "StayInput.st");
            }
        }
	}
}
