package memeber;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.review.ReviewVO;
import blog.BlogVO;
import blog.BlogVO.SortType;
import common.GetConn;
import stay.BookingVO;
import stay.StayVO;

public class MemberDAO {
	
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	MemberVO vo = null;
	BookingVO bVo = null;
	
	public void pstmtClose() {
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
				pstmtClose();
			}
		}
	}

	// 회원가입 시 아이디 중복체크하기 // 아이디로 회원 정보 조회
	public MemberVO getMemberIdCheck(String mid) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from member2 where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setmIdx(rs.getInt("mIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setResidence(rs.getString("residence"));
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
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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
			sql = "update member2 set pwd=?, name=?, nickName=?, tel=?, email=?, photo=?, content=?, userInfo=? where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPwd());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getTel());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getPhoto());
			pstmt.setString(7, vo.getContent());
			pstmt.setString(8, vo.getUserInfo());
			pstmt.setString(9, vo.getMid());
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
			sql = "update member2 set userDel='OK' where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
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
			
			if (rs.next()) {
				vo.setmIdx(rs.getInt("mIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setResidence(rs.getString("residence"));
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

	// 비밀번호 찾기
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

	public int getTotRecCnt(String contentsShow, String part) {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from booking where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contentsShow);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return totRecCnt;
	}

	// 회원별 예약리스트
	public ArrayList<BookingVO> getMemberBookingList(int startIndexNo, int pageSize, String contentsShow) {
		ArrayList<BookingVO> vos = new ArrayList<BookingVO>();
		try {
			sql = "select *, datediff(now(), b.checkIn) as date_diff, s.sName as sName from booking b join stay s on b.sIdx = s.sIdx "
					+ "where mid = ? order by b.bDate desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contentsShow);
			pstmt.setInt(2, startIndexNo);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bVo = new BookingVO();
				bVo.setbIdx(rs.getInt("bIdx"));
				bVo.setsIdx(rs.getInt("sIdx"));
				bVo.setMid(rs.getString("mid"));
				bVo.setbDate(rs.getString("bDate"));
				bVo.setCheckIn(rs.getString("checkIn"));
				bVo.setCheckOut(rs.getString("checkOut"));
				bVo.setGuestNum(rs.getInt("guestNum"));
				bVo.setTotal(rs.getInt("total"));
				bVo.setStatus(rs.getString("status"));

				bVo.setsName(rs.getString("sName"));
				bVo.setDate_diff(rs.getInt("date_diff"));
				
				vos.add(bVo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	
	// 회원별 위시리스트
	public ArrayList<StayVO> getMemberWishList(String mid) {
		ArrayList<StayVO> wishVos = new ArrayList<StayVO>();
		try {
			sql = "select s.*, (SELECT COUNT(*) FROM stayWish w WHERE w.sIdx = s.sIdx AND w.mid = ?) AS isWished, "
					+ "(SELECT COUNT(*) FROM stayWish w WHERE w.sIdx = s.sIdx) AS wishCnt from stay s "
					+ "join stayWish w on s.sIdx = w.sIdx where s.sDel = 'NO' and w.mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				StayVO sVo = new StayVO();
                sVo.setsIdx(rs.getInt("sIdx"));
                sVo.setSort(rs.getString("sort"));
                sVo.setsName(rs.getString("sName"));
                sVo.setsPhoto(rs.getString("sPhoto"));
                sVo.setStar(rs.getInt("star"));
                sVo.setAddress(rs.getString("address"));
                sVo.setsContent(rs.getString("sContent"));
                sVo.setGuestMax(rs.getInt("guestMax"));
                sVo.setPrice(rs.getInt("price"));
                sVo.setResidence(rs.getString("residence"));
                sVo.setsDate(rs.getString("sDate"));
                sVo.setsDel(rs.getString("sDel"));
                sVo.setIsWished(rs.getInt("isWished"));
                sVo.setWishCnt(rs.getInt("wishCnt"));
                
                wishVos.add(sVo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return wishVos;
	}

	public ArrayList<BlogVO> getMemberBlogList(String mid) {
		ArrayList<BlogVO> tVos = new ArrayList<BlogVO>();
		try {
			sql = "select *, datediff(now(), tDate) as date_diff, timestampdiff(hour, tDate, now()) as hour_diff from travelog where mid = ? order by tIdx limit 3";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BlogVO tVo = new BlogVO();
				
				tVo.settIdx(rs.getInt("tIdx"));
				tVo.setMid(rs.getString("mid"));
				tVo.setNickName(rs.getString("nickName"));
				tVo.settPhoto(rs.getString("tPhoto"));
				tVo.setSort(SortType.valueOf(rs.getString("sort")));
				tVo.setTitle(rs.getString("title"));
				tVo.setResidence(rs.getString("residence"));
				tVo.settDate(rs.getString("tDate"));
				tVo.setViewCnt(rs.getInt("viewCnt"));
				tVo.setLikedCnt(rs.getInt("likedCnt"));
				tVo.setOpenSw(rs.getString("openSw"));
				tVo.setHostIp(rs.getString("hostIp"));
				tVo.settContent(rs.getString("tContent"));
				tVo.setComplaint(rs.getString("complaint"));
				
				tVo.setHour_diff(rs.getInt("hour_diff"));
				tVo.setDate_diff(rs.getInt("date_diff"));
				
				tVos.add(tVo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return tVos;
	}

	public ArrayList<ReviewVO> getMemberReviews(String mid) {
		ArrayList<ReviewVO> rVos = new ArrayList<ReviewVO>();
		try {
			sql = "select * from review where mid = ? order by rIdx limit 3";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReviewVO rVo = new ReviewVO();
				rVo.setrIdx(rs.getInt("rIdx"));
				rVo.setPart(rs.getString("part"));
				rVo.setPartIdx(rs.getInt("partIdx"));
				rVo.setMid(rs.getString("mid"));
				rVo.setNickName(rs.getString("nickName"));
				rVo.setStar(rs.getInt("star"));
				rVo.setrContent(rs.getString("rContent"));				
				rVo.setrDate(rs.getString("rDate"));
				rVo.setPurpose(rs.getString("purpose"));
								
				rVos.add(rVo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return rVos;
	}
}
