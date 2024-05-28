package memeber;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.SecurityUtil;
import common.UuidProcess;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/img/member");  // 경로 마지막 / 안붙여도 됨
		int maxSize = 1024 * 1024 * 5;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());  // 중복방지를 위함 DefaultFileRenamePolicy 생성
		
		String mid = multipartRequest.getParameter("mid")==null ? "" : multipartRequest.getParameter("mid");  // request가 multipartRequest에 일임한 것  // request로 받으면 다 null 나옴
		String pwd = multipartRequest.getParameter("pwd")==null ? "" : multipartRequest.getParameter("pwd");
		String name = multipartRequest.getParameter("name")==null ? "" : multipartRequest.getParameter("name");
		String nickName = multipartRequest.getParameter("nickName")==null ? "" : multipartRequest.getParameter("nickName");
		String tel = multipartRequest.getParameter("tel")==null ? "" : multipartRequest.getParameter("tel");
		String email = multipartRequest.getParameter("email")==null ? "" : multipartRequest.getParameter("email");
		String residence = multipartRequest.getParameter("residence")==null ? "" : multipartRequest.getParameter("residence");
		String photo = multipartRequest.getFilesystemName("fName")==null ? "noImage.jpg" : multipartRequest.getFilesystemName("fName");  // getParameter 앞에서 저장된 이름 -불러온 이름으로 db에 저장하면 의미x // 서버에 저장된 파일시스템 이름으로 저장해야함(똑같은 10.jpg가 있으면 101.jpg로 저장됨 => db에 10.jpg로 저장하면 의미없음, 실제로 저장된 101.jpg로 db에 저장해야함 
		String content = multipartRequest.getParameter("content")==null ? "" : multipartRequest.getParameter("content");
		String userInfo = multipartRequest.getParameter("userInfor")==null ? "" : multipartRequest.getParameter("userInfor");
		
		// DB에 저장시킬 자료 중 not null 데이터는 Back End 체크시켜준다.(나중에 annotation 붙여서 할 것)
		
		// 아이디/닉네임 중복체크....(front에서 체크하고 왔으나 해커 어쩌구 때문에 백엔드에서도 체크)
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberIdCheck(mid);
		if(vo.getMid() != null) {
			request.setAttribute("message", "이미 사용중인 아이디 입니다.");
			request.setAttribute("url", "MemberJoin.mem");  // 확장자 패턴 사용 중이므로 request.getContextPath() 생략가능
			return;
		}
		
		vo = dao.getMemberNickCheck(nickName);
		if(vo.getNickName() != null) {
			request.setAttribute("message", "이미 사용중인 닉네임 입니다.");
			request.setAttribute("url", "MemberJoin.mem");
			return;
		}
		
		// 비밀번호 암호화(sha256) 256bit 64자리(4로 나눔) - salt키를 만든 후 암호화 시켜준다.(uuid코드 중 앞자리 8자리와 같이 병형처리 후 암호화시킨다.)
		// uuid를 통한 salt키 만들기(앞에서 8자리를 가져왔다.)
		String salt = UUID.randomUUID().toString().substring(0,8);  // 문자화 해서 담음
		
		SecurityUtil securityUtil = new SecurityUtil();
		pwd = securityUtil.encryptSHA256(salt + pwd);  // 64자리의 암호화된 숫자가 pwd에 담김 // (가입시 입력한 pwd)
		
		pwd = salt + pwd;  // DB저장할 때 salt키 안 만듦(기존 pw에 합쳐서 저장)
		
		// 모든 체크가 끝난 자료는 vo에 담아서 DB에 저장처리한다.
		vo = new MemberVO();
		vo.setMid(mid);
		vo.setPwd(pwd);  // 암호화 된 것 vo.setPwd(salt + pwd);로 저장(나중에 비교할때 8자리 빼고 비교)
		vo.setName(name);
		vo.setNickName(nickName);
		vo.setTel(tel);
		vo.setEmail(email);
		vo.setEmail(residence);
		vo.setPhoto(photo);
		vo.setContent(content);
		vo.setUserInfo(userInfo);
		
		int res = dao.setMemberJoinOk(vo);  // vo를 넘김
		
		if(res != 0) {  // 0이 아니면 1개라도 처리한 것
			request.setAttribute("message", "회원 가입되셨습니다. \\n다시 로그인 해주세요.");
			request.setAttribute("url", "MemberLogin.mem");
		}
		else {
			request.setAttribute("message", "회원 가입 실패!");
			request.setAttribute("url", "MemberJoin.mem");
		}
	}

}
