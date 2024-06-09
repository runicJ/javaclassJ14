package memeber;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		// 아래로 회원 인증 처리  (SHA-256 하기 전이라서 아래처럼 간단히 처리 // 회원가입시 비번 암호화 후에 처리)
		if(vo.getPwd() == null || vo.getUserDel().equals("OK")) {  // 탈퇴 신청한 회원 보여주면 안됨
			request.setAttribute("message", "입력하신 회원정보가 없습니다.\\n확인하고 다시 로그인 해주세요.");
			request.setAttribute("url", "MemberLogin.mem");
			return;
		}
		
		// 저장된 비밀번호에서 salt키를 분리시켜서 다시 암호화 시킨 후 맞는지 비교처리한다.
		// salt키 분리  // 먼저 salt키로 무작위 수를 만들고 회원가입시 입력한 비번과 합쳐서 sha256으로 암호처리, DB에 저장할때 암호처리된 비밀번호 앞에 만든 salt키를 붙여서 저장/ 로그인시 DB에 저장된 pw의 salt키(8자리) 분리하고 로그인할때 입력한 pw와 합쳐서 sha256 암호화 한다음 DB에 저장된 것과 비교
		String salt = vo.getPwd().substring(0,8);
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt + pwd);
		
		if(!vo.getPwd().substring(8).equals(pwd)) {  // DB pwd 8자리부터
			request.setAttribute("message", "비밀번호를 확인하세요");  // 회원정보가 없습니다.  // 메시지 전달
			request.setAttribute("url", "MemberLogin.mem");
			return;
		}
	
		// 3번처리 : 방문포인트와 카운트를 증가처리한 내용을 vo에 모두 담았다면 DB 자신의 레코드에 변경된 사항들을 갱신 처리해준다.
//		dao.setLoginUpdate(vo);
//		
//		// 쿠키에 아이디를 저장/해제 처리한다.
//		// 로그인시 아이디저장시킨다고 체크하면 쿠키에 아이디 저장하고, 그렇지 않으면 쿠키에서 아이디를 제거한다.  // 쿠키말고 클라이언트에 저장하는거 나중에
//		String idSave = request.getParameter("idSave")==null ? "off" : "on";
//		Cookie cookieMid = new Cookie("cMid", mid);
//		cookieMid.setPath("/");  // 상위 폴더에 쿠키값을 저장하겠다(Root에)
//		if(idSave.equals("on")) {
//			cookieMid.setMaxAge(60*60*24*7);	// 쿠키의 만료시간은 1주일로 한다. // 저장x 기록을 해야함(client cookie 저장소에 저장)
//		}
//		else {
//			cookieMid.setMaxAge(0);
//		}
//		response.addCookie(cookieMid);
		
		// 필요한 정보를 session에 저장처리한다.
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		session.setAttribute("sNickName", vo.getNickName());
		session.setAttribute("sPhoto", vo.getPhoto());

		request.setAttribute("message", mid+"님 로그인 되셨습니다.");
		request.setAttribute("url", request.getContextPath()+"/Main");
	}

}

/*
 * 1 *
HashSet은 Java에서 제공하는 Set 인터페이스를 구현한 클래스 중 하나입니다. Set은 중복을 허용하지 않고 순서를 보장하지 않는 자료구조입니다. 
HashSet은 이러한 Set의 특징을 그대로 따르면서 해시 테이블을 사용하여 요소를 저장하기 때문에 매우 빠른 검색 속도를 제공합니다.

예를 들어보겠습니다. 친구 목록을 관리하는 프로그램을 만든다고 가정해봅시다. 이 프로그램에서는 한 명의 친구가 여러 번 등록되더라도 중복으로 처리하지 않아야 합니다. 
이때 HashSet을 사용하면 효율적으로 중복을 제거할 수 있습니다.

import java.util.HashSet;

public class Main {
    public static void main(String[] args) {
        HashSet<String> friendSet = new HashSet<>();
        
        // 친구 목록에 중복된 이름을 추가해도 HashSet은 중복을 허용하지 않습니다.
        friendSet.add("John");
        friendSet.add("Alice");
        friendSet.add("John"); // 중복된 요소이므로 무시됩니다.
        friendSet.add("Bob");
        friendSet.add("Alice"); // 중복된 요소이므로 무시됩니다.
        
        // HashSet의 크기를 출력하면 중복이 제거된 친구의 수를 알 수 있습니다.
        System.out.println("친구 목록의 크기: " + friendSet.size()); // 출력: 친구 목록의 크기: 3
        
        // HashSet을 반복문으로 순회하면 요소의 순서는 보장되지 않습니다.
        for (String friend : friendSet) {
            System.out.println(friend);
        }
    }
}
이 코드에서는 HashSet을 사용하여 친구 목록을 관리합니다. HashSet은 중복된 요소를 허용하지 않으므로 "John", "Alice"와 같이 중복된 이름을 여러 번 추가해도 중복이 제거됩니다. 
이후 HashSet의 크기를 출력하면 중복이 제거된 친구의 수를 알 수 있습니다.

HashSet을 반복문으로 순회할 때는 요소의 순서가 보장되지 않습니다. 따라서 출력 결과는 요소가 추가된 순서와 다를 수 있습니다.

 * 2 *
HashSet은 자바의 컬렉션 프레임워크에서 Set 인터페이스를 구현한 클래스 중 하나입니다. Set은 순서가 없고 중복을 허용하지 않는 데이터의 집합을 나타냅니다. 
HashSet은 이러한 Set의 특성을 가지면서 내부적으로 해시 테이블을 사용하여 데이터를 저장합니다.

예를 들어, 게시판의 방명록에는 각 사용자가 방문한 날짜가 기록되어 있습니다. 회원이 여러 번 방문했더라도 하루에 여러 번 방문한 경우에는 하루에 중복되는 날짜는 한 번으로만 계산해야 합니다. 
이때 HashSet을 사용하면 중복된 날짜를 간편하게 제거할 수 있습니다.

import java.util.HashSet;

public class HashSetExample {
    public static void main(String[] args) {
        HashSet<String> uniqueDates = new HashSet<>();
        
        // 방문 날짜 추가
        uniqueDates.add("2024-05-10");
        uniqueDates.add("2024-05-10"); // 중복된 값이므로 무시됨
        uniqueDates.add("2024-05-11");
        uniqueDates.add("2024-05-12");
        uniqueDates.add("2024-05-12"); // 중복된 값이므로 무시됨
        
        // 중복이 제거된 방문 날짜 출력
        System.out.println("중복이 제거된 방문 날짜:");
        for (String date : uniqueDates) {
            System.out.println(date);
        }
    }
}
이 예제에서는 HashSet을 사용하여 방문한 날짜를 저장하고, 중복된 값이 무시되는 것을 확인할 수 있습니다. 따라서 uniqueDates에는 중복이 제거된 방문 날짜만 남게 됩니다.
HashSet을 이용하면 중복된 값 제거와 같은 작업을 간단하게 처리할 수 있습니다.
*/