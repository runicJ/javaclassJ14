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
		String realPath = request.getServletContext().getRealPath("/images/member");  // 경로 마지막 / 안붙여도 됨
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());  // 중복방지를 위함 DefaultFileRenamePolicy 생성
		
		// 회원 사진 업로드 되었는지 여부 처리? 업로드된 파일이 있으면 서버에 저장된 이름을, 없으면 기존파일명을 fsName변수에 저장한다.
		String photo = multipartRequest.getFilesystemName("fName");
		String fName = multipartRequest.getParameter("photo");
		if(photo == null) photo = fName;
		else {
			new File(realPath + fName).delete();  // 실제 존재하는 파일은 파일(io) 객체를 만들고 지워야 함
		}
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String sNickName = (String) session.getAttribute("sNickName");
		
		String pwd = multipartRequest.getParameter("pwd")==null ? "" : multipartRequest.getParameter("pwd");
		String name = multipartRequest.getParameter("name")==null ? "" : multipartRequest.getParameter("name");
		String nickName = multipartRequest.getParameter("nickName")==null ? "" : multipartRequest.getParameter("nickName");
		String tel = multipartRequest.getParameter("tel")==null ? "" : multipartRequest.getParameter("tel");
		String email = multipartRequest.getParameter("email")==null ? "" : multipartRequest.getParameter("email");
		String residence = multipartRequest.getParameter("residence")==null ? "" : multipartRequest.getParameter("residence");
		//String photo = multipartRequest.getFilesystemName("fName")==null ? "noImage.jpg" : multipartRequest.getFilesystemName("fName");  // getParameter 앞에서 저장된 이름 -불러온 이름으로 db에 저장하면 의미x // 서버에 저장된 파일시스템 이름으로 저장해야함(똑같은 10.jpg가 있으면 101.jpg로 저장됨 => db에 10.jpg로 저장하면 의미없음, 실제로 저장된 101.jpg로 db에 저장해야함 
		String content = multipartRequest.getParameter("content")==null ? "" : multipartRequest.getParameter("content");
		String userInfo = multipartRequest.getParameter("userInfor")==null ? "" : multipartRequest.getParameter("userInfor");
		
		// DB에 저장시킬 자료 중 not null 데이터는 Back End 체크시켜준다.(나중에 annotation 붙여서 할 것)
		
		// 아이디/닉네임 중복체크....(front에서 체크하고 왔으나 해커 어쩌구 때문에 백엔드에서도 체크)
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberIdCheck(mid);
		if(vo.getMid() != null) {
			request.setAttribute("message", "이미 사용중인 아이디 입니다.");
			request.setAttribute("url", "MemberJoin.mem");
			return;
		}
		
		vo = dao.getMemberNickCheck(nickName);
		if(vo.getNickName() != null) {
			request.setAttribute("message", "이미 사용중인 닉네임 입니다.");
			request.setAttribute("url", "MemberJoin.mem");
			return;
		}
		
		vo = dao.getMemberTelCheck(tel);
		if(vo.getTel() != null) {
			request.setAttribute("message", "이미 사용중인 전화번호 입니다.");
			request.setAttribute("url", "MemberJoin.mem");
			return;
		}
		
		String salt = UUID.randomUUID().toString().substring(0,8);  // 문자화 해서 담음
		
		SecurityUtil securityUtil = new SecurityUtil();
		pwd = securityUtil.encryptSHA256(salt + pwd);
		
		pwd = salt + pwd;
		
		vo = new MemberVO();
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
			session.setAttribute("sNickName", vo.getNickName());
			request.setAttribute("message", "회원 정보가 수정되었습니다.");
			request.setAttribute("url", "MemberMain.mem");
		}
		else {
			request.setAttribute("message", "회원정보 수정 실패~~");
			request.setAttribute("url", "MemberUpdate.mem");
		}
	}

}
