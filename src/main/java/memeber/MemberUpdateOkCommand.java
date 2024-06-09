package memeber;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.SecurityUtil;

public class MemberUpdateOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/member/");
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		String photo = multipartRequest.getFilesystemName("fName")==null ? "noImage.jpg" : multipartRequest.getFilesystemName("fName");
		String fName = multipartRequest.getParameter("photo");
		if(photo == null) photo = fName;
		else {
			new File(realPath + fName).delete();
		}
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String pwd = multipartRequest.getParameter("newPwd")==null ? multipartRequest.getParameter("pwd") : multipartRequest.getParameter("newPwd");
		String name = multipartRequest.getParameter("name")==null ? "" : multipartRequest.getParameter("name");
		String nickName = multipartRequest.getParameter("nickName")==null ? "" : multipartRequest.getParameter("nickName");
		String tel = multipartRequest.getParameter("tel")==null ? "" : multipartRequest.getParameter("tel");
		String email = multipartRequest.getParameter("email")==null ? "" : multipartRequest.getParameter("email");
		String residence = multipartRequest.getParameter("residence")==null ? "" : multipartRequest.getParameter("residence");
		String content = multipartRequest.getParameter("content")==null ? "" : multipartRequest.getParameter("content");
		String userInfo = multipartRequest.getParameter("userInfo")==null ? "" : multipartRequest.getParameter("userInfo");
		
		MemberDAO dao = new MemberDAO();
		
		String salt = UUID.randomUUID().toString().substring(0,8);
		
		SecurityUtil securityUtil = new SecurityUtil();
		pwd = securityUtil.encryptSHA256(salt + pwd);
		
		pwd = salt + pwd;
		
		MemberVO vo = new MemberVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setNickName(nickName);
		vo.setTel(tel);
		vo.setEmail(email);
		vo.setResidence(residence);
		vo.setPhoto(photo);
		vo.setContent(content);
		vo.setUserInfo(userInfo);
		
		int res = dao.setMemberUpdateOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "회원 정보가 수정되었습니다.");
			request.setAttribute("url", "MemberMain.mem");
		}
		else {
			request.setAttribute("message", "회원정보 수정 실패~~");
			request.setAttribute("url", "MemberUpdate.mem");
		}
	}

}
