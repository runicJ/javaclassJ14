package blog;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import blog.BlogVO.SortType;

public class BlogUpdateOkCommand implements BlogInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String realPath = request.getServletContext().getRealPath("/images/blog");
		int maxSize = 1024 * 1024 * 30;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());  // 생성과 동시에 업로드 된다.(알아서 넘긴 데이터가 realPath 자리에 알아서 저장이 됨)
		
		Enumeration fileNames = multipartRequest.getFileNames();
		
		String file = "";
		String oFileName = "";
		
		String[] fSNames = request.getParameter("fSName").split("/");
		
		for(String fSName : fSNames) {
			new File(realPath + fSName).delete();  // 실제 존재하는 파일은 파일(io) 객체를 만들고 지워야 함
		}
		
		while(fileNames.hasMoreElements()) {
			file = (String) fileNames.nextElement();
			
			if(multipartRequest.getFilesystemName(file) != null) {
				oFileName += multipartRequest.getOriginalFileName(file) + "/";
			}
		}
		oFileName = oFileName.substring(0, oFileName.lastIndexOf("/"));
		String mid = multipartRequest.getParameter("mid")==null ? "" : multipartRequest.getParameter("mid");
		String nickName = multipartRequest.getParameter("nickName")==null ? "" : multipartRequest.getParameter("nickName");
		String sort = multipartRequest.getParameter("sort")==null ? "" : multipartRequest.getParameter("sort");
		String title = multipartRequest.getParameter("title")==null ? "" : multipartRequest.getParameter("title");
		String residence = multipartRequest.getParameter("residence")==null ? "" : multipartRequest.getParameter("residence");
		String openSw = multipartRequest.getParameter("openSw")==null ? "" : multipartRequest.getParameter("openSw");
		String hostIp = multipartRequest.getParameter("hostIp")==null ? "" : multipartRequest.getParameter("hostIp");
		String tContent = multipartRequest.getParameter("tContent")==null ? "" : multipartRequest.getParameter("tContent");
		
		BlogDAO dao = new BlogDAO();
		BlogVO vo = new BlogVO();
		
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.settPhoto(oFileName);
		vo.setSort(SortType.valueOf(sort));
		vo.setTitle(title);
		vo.setResidence(residence);
		vo.setOpenSw(openSw);
		vo.setHostIp(hostIp);
		vo.settContent(tContent);
		
		int res = dao.setBlogInputOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "블로그 글이 수정되었습니다.");
			request.setAttribute("url", "BlogDetail.bl?tIdx=" + vo.gettIdx());
		}
		else {
			request.setAttribute("message", "글 수정 실패!");
			request.setAttribute("url", "BlogUpdate.bl");
		}
	}
}
