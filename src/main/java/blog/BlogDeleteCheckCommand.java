package blog;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BlogDeleteCheckCommand implements BlogInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tIdx = request.getParameter("tIdx")==null ? 0 : Integer.parseInt(request.getParameter("tIdx"));
		String[] tPhotos = request.getParameter("tPhoto").split("/");
		
		String realPath = request.getServletContext().getRealPath("/images/blog/");
		for(String fName : tPhotos) {
			new File(realPath + fName).delete();
		}
		
		BlogDAO dao = new BlogDAO();
		int res = dao.setBlogDelete(tIdx);
		
		response.getWriter().write(res + "");
	}

}
