package memeber;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class MemberDAO {  // 3
	
	private Connection conn = GetConn.getConn();  // 필드 먼저 줌 sql에서 가져옴  // getConn.getConn() 하지말고 바로 클래스명 Getconn. 사용해라
	private PreparedStatement pstmt = null;  // sql에서
	private ResultSet rs = null;  // 3개 먼저 선언
	
	private String sql = "";
	MemberVO vo = null;  // 여기까지 기본
	
	public void pstmtClose() {  // ConnClose 여기서 하면 싱글톤은 종속적임, 모든 사용자 서버 전부 닫힘
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {}
		}
	}
	
	public void rsClose() {
		if(pstmt != null) {
			try {
				rs.close();
			} catch (Exception e) {}
			finally {			
				pstmtClose();  // 참, 거짓 다 통과하고 사용하라고 밑에 씀 위에 쓰면 뭐
			}
		}
	}

	// 회원가입 시 아이디 중복체크하기.
	public MemberVO getMemberIdCheck(String mid) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from member2 where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();  // 자료가 있으면 넘어옴
			
			if(rs.next()) {  // 자료가 있는지 없는지 모름
				vo.setmIdx(rs.getInt("mIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setEmail(rs.getString("residence"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setUserInfo(rs.getString("userInfo"));
				vo.setUserDel(rs.getString("userDel"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 회원가입 처리
	public int setMemberJoinOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "insert into member2 values (default,?,?,?,?,?,?,?,?,?,default,default,?,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getNickName());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getEmail());
			pstmt.setString(7, vo.getResidence());
			pstmt.setString(8, vo.getPhoto());
			pstmt.setString(9, vo.getContent());
			pstmt.setString(10, vo.getUserInfo());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 닉네임 검색을 통한 자료의 수집
	public MemberVO getMemberNickCheck(String nickName) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from member2 where nickName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();  // 자료가 있으면 넘어옴
			
			if(rs.next()) {  // 자료가 있는지 없는지 모름
				vo.setmIdx(rs.getInt("mIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setEmail(rs.getString("residence"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setUserInfo(rs.getString("userInfo"));
				vo.setUserDel(rs.getString("userDel"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 회원 전체 리스트
	public ArrayList<MemberVO> getMemberList() {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		try {
			sql = "select * from member2 order by idx";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();  // 자료가 있으면 넘어옴
			
			while(rs.next()) {  // 전체 가져와야 하니까 while문
				vo = new MemberVO();  // 새로 안만들면 객체가 다 덮어씀
				vo.setmIdx(rs.getInt("mIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfo(rs.getString("userInfo"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 비밀번호 변경처리
	public int setMemberPwdChange(String mid, String pwd) {
		int res = 0;
		try {
			sql = "update member2 set pwd=? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, mid);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

  // 회원 정보 수정처리
	public int setMemberUpdateOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "update member2 set nickName=?, name=?, tel=?, email=?, photo=?, content=?, userInfo=? where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getTel());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getPhoto());
			pstmt.setString(6, vo.getContent());
			pstmt.setString(7, vo.getMid());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 회원 탈퇴 신청처리...
	public int setMemberDeleteUpdate(String mid) {
		int res = 0;
		try {
			sql = "update member2 set userDel='OK', level=99 where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			res = pstmt.executeUpdate();  // 완전히 삭제하지 않고 업데이트 시킴
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	// 채팅내용 DB에 저장하기
	public void setMemberChatInputOk(String mid, String chat) {
		try {
			sql = "insert into memberChat values(default,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, chat);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 연락처 중복체크
	public MemberVO getMemberTelCheck(String tel) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from member2 where tel = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tel);
			rs = pstmt.executeQuery();  // 자료가 있으면 넘어옴
			
			if(rs.next()) {  // 자료가 있는지 없는지 모름
				vo.setmIdx(rs.getInt("mIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setEmail(rs.getString("residence"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setUserInfo(rs.getString("userInfo"));
				vo.setUserDel(rs.getString("userDel"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 아이디 찾기
	public MemberVO getMemberFindId(String name, String tel) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from member2 where name= ? and tel = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, tel);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {  // 자료가 있는지 없는지 모름
				vo.setmIdx(rs.getInt("mIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setEmail(rs.getString("residence"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setUserInfo(rs.getString("userInfo"));
				vo.setUserDel(rs.getString("userDel"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	public int getMemberFindPw(String mid, String name, String tel) {
		int res = 0;
		try {
			sql = "select * from member2 where mid = ? and name= ? and tel = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, name);
			pstmt.setString(3, tel);
	        rs = pstmt.executeQuery();
			if(rs.next()) res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return res;
	}
	
}
