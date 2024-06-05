package stay;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import memeber.MemberVO;

public class StayDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql = "";
	StayVO vo = null;
	FacilityVO fVo = null;
	
	public StayDAO() {
		String url = "jdbc:mysql://localhost:3306/javaclass14";
		String user = "root";
		String password = "1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패~~" + e.getMessage());
		} catch (SQLException e) {
			System.out.println("DB 연동 실패~~" + e.getMessage());
		}
	}
	
	// conn객체 반납
	public void connClose() {
		if(conn != null) {
			try {
				conn.close();
			} catch (Exception e) {}  // 여기서 오류 잘 안남 나면 시스템 문제
		}
	}
	
	// pstmt 반납
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {}
		}
	}
	
	// rs 반납
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (Exception e) {}
		}
		pstmtClose();  // 정확히는 if 밖에 써야함
	}
	
	// 숙소 등록하기(일단 관리자만)
	public Map<String, Object> setStayInputOk(StayVO vo) {
		Map<String, Object> result = new HashMap<>();
		int res = 0, sIdx = 0;
		try {
			conn.setAutoCommit(false);
			
			sql="insert into stay values (default,?,?,?,default,?,?,?,?,?,default,default)";
			pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, vo.getSort());
			pstmt.setString(2, vo.getsName());
			pstmt.setString(3, vo.getsPhoto());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getsContent());
			pstmt.setInt(6, vo.getGuestMax());
			pstmt.setInt(7, vo.getPrice());
			pstmt.setString(8, vo.getResidence());
			res = pstmt.executeUpdate();
			rs = pstmt.getGeneratedKeys();
			
			if(rs.next()) {
				sIdx = rs.getInt(1);
			}
			
			result.put("res", res);
			result.put("sIdx", sIdx);
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return result;
	}

	// 해당 숙소의 옵션 등록하기
	public void setStayfacility(FacilityVO fVo) {
		try {
			sql="insert into facility values (default,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fVo.getBed());
			pstmt.setInt(2, fVo.getToilet());
			pstmt.setBoolean(3, fVo.isWifi());
			pstmt.setBoolean(4, fVo.isAc());
			pstmt.setBoolean(5, fVo.isParking());
			pstmt.setBoolean(6, fVo.isPet());
			pstmt.setBoolean(7, fVo.isKitchen());
			pstmt.setBoolean(8, fVo.isWashing());
			pstmt.setInt(9, fVo.getsIdx());
			pstmt.executeUpdate();
			
			conn.commit();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
			try {
				if(conn != null) conn.rollback();
			} catch (Exception e2) {}
		} finally {
			pstmtClose();
		}
	}

	public StayVO getStayIdxDetail(int sIdx) {
		try {
			sql="select * from stay where sIdx=? order by sIdx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sIdx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new StayVO();
				vo.setsIdx(rs.getInt("sIdx"));
				vo.setSort(rs.getString("sort"));
				vo.setsName(rs.getString("sName"));
				vo.setsPhoto(rs.getString("sPhoto"));
				vo.setStar(rs.getInt("star"));
				vo.setAddress(rs.getString("address"));
				vo.setsContent(rs.getString("sContent"));
				vo.setGuestMax(rs.getInt("guestMax"));
				vo.setPrice(rs.getInt("price"));
				vo.setResidence(rs.getString("residence"));
				vo.setsDate(rs.getString("sDate"));
				vo.setsDel(rs.getString("sDel"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	public FacilityVO getStayIdxFacility(int sIdx) {
		try {
			sql="select * from facility where sIdx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sIdx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				fVo = new FacilityVO();
				fVo.setfIdx(rs.getInt("fIdx"));
				fVo.setBed(rs.getInt("bed"));
				fVo.setToilet(rs.getInt("toilet"));
				fVo.setWifi(rs.getBoolean("wifi"));
				fVo.setAc(rs.getBoolean("ac"));
				fVo.setParking(rs.getBoolean("parking"));
				fVo.setPet(rs.getBoolean("pet"));
				fVo.setKitchen(rs.getBoolean("kitchen"));
				fVo.setWashing(rs.getBoolean("washing"));
				fVo.setsIdx(rs.getInt("sIdx"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return fVo;
	}
	
	public int setStayDiscontinue(int sIdx) {
		int res = 0;
		try {
			sql = "update stay set sDel='OK' where sIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sIdx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	public ArrayList<StayVO> getStayList(String contentsShow) {
		ArrayList<StayVO> vos = new ArrayList<StayVO>();
		try {
			if(contentsShow.equals("adminOK")) {
				sql = "select *, datediff(wDate, now()) as date_diff, timestampdiff(hour, wDate, now()) as hour_diff, "
						+ "(select count(*) from boardReply where boardIdx = b.idx) as replyCnt "  // 끝에 무조건 하나 띄우기
						+ "from stay b order by idx desc limit ?,?";  /* 새로운 변수가 만들어진 필드가 되었으므로 vo에 등록 */
				pstmt = conn.prepareStatement(sql);
			}
			else {
				sql = "select *, datediff(wDate, now()) as date_diff, timestampdiff(hour, wDate, now()) as hour_diff, "  // 줄 바꿀때 끝에  공간이 있어야 함
						+ "(select count(*) from boardReply where boardIdx = b.idx) as replyCnt "
						+ "from board b where openSW = 'OK' and complaint = 'NO' union select *, datediff(wDate, now()) as date_diff, "
						+ "timestampdiff(hour, wDate, now()) as hour_diff, "
						+ "(select count(*) from boardReply where boardIdx = b.idx) as replyCnt "
						+ "from stay b where mid = ? order by idx desc limit ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, contentsShow);
			}
			rs = pstmt.executeQuery();

			while(rs.next()) {
				vo = new StayVO();
				//vo.getsIdx(rs.getInt("sIdx"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	public ArrayList<StayVO> getVestFourStay() {
		ArrayList<StayVO> vos = new ArrayList<StayVO>();
		try {
			sql = "select * from stay order by star desc limit 4";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo.setsIdx(rs.getInt("sIdx"));
				vo.setSort(rs.getString("sort"));
				vo.setsName(rs.getString("sName"));
				vo.setsPhoto(rs.getString("sPhoto"));
				vo.setStar(rs.getInt("star"));
				vo.setAddress(rs.getString("address"));
				vo.setsContent(rs.getString("sContent"));
				vo.setGuestMax(rs.getInt("guestMax"));
				vo.setPrice(rs.getInt("price"));
				vo.setResidence(rs.getString("residence"));
				vo.setsDate(rs.getString("sDate"));
				vo.setsDel(rs.getString("sDel"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	
	// 회원 전체/부분 리스트
//	public ArrayList<MemberVO> getMemberList(int level) {
//		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
//		try {
//			if(level == 999) {
//				sql = "select *, timestampdiff(day, lastDate, now()) as deleteDiff from member2 order by idx desc";
//				pstmt = conn.prepareStatement(sql);
//			}
//			else {				
//				sql = "select *, timestampdiff(day, lastDate, now()) as deleteDiff from member2 where level=? order by idx desc";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, level);
//			}
//			rs = pstmt.executeQuery();
//
//			while(rs.next()) {
//				vo = new MemberVO();
//				vo.setIdx(rs.getInt("idx"));
//				vo.setMid(rs.getString("mid"));
//				vo.setPwd(rs.getString("pwd"));
//				vo.setNickName(rs.getString("nickName"));
//				vo.setName(rs.getString("name"));
//				vo.setGender(rs.getString("gender"));
//				vo.setBirthday(rs.getString("birthday"));
//				vo.setTel(rs.getString("tel"));
//				vo.setAddress(rs.getString("address"));
//				vo.setEmail(rs.getString("email"));
//				vo.setHomePage(rs.getString("homePage"));
//				vo.setJob(rs.getString("job"));
//				vo.setHobby(rs.getString("hobby"));
//				vo.setPhoto(rs.getString("photo"));
//				vo.setContent(rs.getString("content"));
//				vo.setUserInfor(rs.getString("userInfor"));
//				vo.setUserDel(rs.getString("userDel"));
//				vo.setPoint(rs.getInt("point"));
//				vo.setLevel(rs.getInt("level"));
//				vo.setVisitCnt(rs.getInt("visitCnt"));
//				vo.setStartDate(rs.getString("startDate"));
//				vo.setLastDate(rs.getString("lastDate"));
//				vo.setTodayCnt(rs.getInt("todayCnt"));
//				
//				vo.setDeleteDiff(rs.getInt("deleteDiff"));
//				
//				vos.add(vo);
//			}
//		} catch (SQLException e) {
//			System.out.println("SQL 오류 : " + e.getMessage());
//		} finally {
//			rsClose();
//		}
//		return vos;
//	}
//
//	// 회원 등급 변경처리
//	public int setMemberLevelChange(int idx, int level) {
//		int res = 0;
//		try {
//			sql = "update member2 set level = ? where idx = ?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, level);
//			pstmt.setInt(2, idx);
//			res = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			System.out.println("SQL 오류 : " + e.getMessage());
//		} finally {
//			pstmtClose();
//		}
//		return res;
//	}
//
//	// 회원 DB에서 삭제처리하기
//	public int MemberDeleteOk(int idx) {
//		int res = 0;
//		try {
//			sql = "delete from member2 where idx = ?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, idx);
//			res = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			System.out.println("SQL 오류 : " + e.getMessage());
//		} finally {
//			pstmtClose();
//		}
//		return res;
//	}
//
//	// 신규회원 건수
//	public int getNewMemberCnt() {
//		int mCount = 0;
//		try {
//			sql = "select count(*) as cnt from member2 where level = 1";
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			
//			rs.next();
//			mCount = rs.getInt("cnt");
//		} catch (SQLException e) {
//			System.out.println("SQL 오류 : " + e.getMessage());
//		} finally {
//			rsClose();
//		}
//		return mCount;
//	}
//	
//	// 각 레벨별 건수 구하기
//	public int getTotRecCnt(int level) {
//		int totRecCnt = 0;
//		try {
//			if(level == 999) {
//				sql = "select count(*) as cnt from member";
//				pstmt = conn.prepareStatement(sql);
//			}
//			else {
//				sql = "select count(*) as cnt  from member where level = ? order by idx desc";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, level);
//			}
//			rs = pstmt.executeQuery();
//			rs.next();
//			totRecCnt = rs.getInt("cnt");
//		} catch (SQLException e) {
//			System.out.println("SQL 오류 : " + e.getMessage());
//		} finally {
//			rsClose();			
//		}
//		return totRecCnt;
//	}
//
//	// 신고내역 저장하기
//	public int setComplaintInput(ComplaintVO vo) {
//		int res = 0;
//		try {
//			sql = "insert into complaint values (default,?,?,?,?,default)";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, vo.getPart());
//			pstmt.setInt(2, vo.getPartIdx());
//			pstmt.setString(3, vo.getCpMid());
//			pstmt.setString(4, vo.getCpContent());
//			res = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			System.out.println("SQL 오류 : " + e.getMessage());
//		} finally {
//			pstmtClose();
//		}
//		return res;
//	}
//
//	// 신고글 유무 체크
//	public String getCall_112(String part, int partIdx) {
//		String call_112 = "NO";
//		try {
//			sql = "select * from complaint where part=? and partIdx=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, part);
//			pstmt.setInt(2, partIdx);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) call_112 = "OK";  // 있다(최대 1개)
//		} catch (SQLException e) {
//			System.out.println("SQL 오류 : " + e.getMessage());
//		} finally {
//			rsClose();
//		}
//		return call_112;
//	}
//
//	// 신고 전체 목록
//	public ArrayList<ComplaintVO> getComplaintList() {
//		ArrayList<ComplaintVO> vos = new ArrayList<ComplaintVO>();
//		try {
//			sql = "select date_format(c.cpDate, '%Y-%m-%d %H:%i') as cpDate, c.*, b.title title, b.nickName nickname, b.mid mid, b.complaint complaint "
//					+ "from complaint c, board b where c.partIdx = b.idx order by idx desc";
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();  // ?가 하나도 없으니까 바로 rs에 담는다
//			
//			ComplaintVO vo = null;
//			while(rs.next()) {
//				vo = new ComplaintVO();
//				vo.setIdx(rs.getInt("idx"));
//				vo.setPart(rs.getString("part"));
//				vo.setPartIdx(rs.getInt("partIdx"));
//				vo.setCpMid(rs.getString("cpMid"));
//				vo.setCpDate(rs.getString("cpDate"));
//				vo.setCpContent(rs.getString("cpContent"));
//				
//				vo.setTitle(rs.getString("title"));
//				vo.setNickName(rs.getString("nickName"));
//				vo.setMid(rs.getString("mid"));
//				vo.setComplaint(rs.getString("complaint"));
//				
//				vos.add(vo);
//			}
//		} catch (SQLException e) {
//			System.out.println("SQL 오류 : " + e.getMessage());
//		} finally {
//			rsClose();
//		}
//		return vos;
//	}
//
//	public void setComplaintCheck(String part, int partIdx, String complaint) {
//		System.out.println("complaint: " + complaint);
//		try {
//			if(complaint.equals("NO")) {
//				sql = "update "+part+" set complaint='OK' where idx=?";
//			}
//			else sql = "update "+part+" set complaint='NO' where idx=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, partIdx);
//			pstmt.executeUpdate();
//		} catch (SQLException e) {
//			System.out.println("SQL 오류 : " + e.getMessage());
//		} finally {
//			pstmtClose();
//		}
//	}
//	
//	// 리뷰를 작성했는지 여부 체크
//	public int getReviewSearch(ReviewVO vo) {
//		int res = 0;
//		try {
//			sql = "select * from review where part = ? and partIdx = ? and mid = ?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, vo.getPart());
//			pstmt.setInt(2, vo.getPartIdx());
//			pstmt.setString(3, vo.getMid());
//			rs = pstmt.executeQuery();
//			if(rs.next()) res = 1;  // 이미 이 아이디로 리뷰를 작성했다
//		} catch (SQLException e) {
//			System.out.println("SQL 오류 : " + e.getMessage());
//		} finally {
//			pstmtClose();
//		}
//		return res;
//	}
//
//	//리뷰작성 처리하기
//	public int setReviewInputOk(ReviewVO vo) {
//		int res = 0;
//		try {
//			sql = "insert into review values (default,?,?,?,?,?,?,default)";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, vo.getPart());
//			pstmt.setInt(2, vo.getPartIdx());
//			pstmt.setString(3, vo.getMid());
//			pstmt.setString(4, vo.getNickName());
//			pstmt.setInt(5, vo.getStar());
//			pstmt.setString(6, vo.getContent());
//			res = pstmt.executeUpdate();  // 한건 처리되면 1 아니면 0
//		} catch (SQLException e) {
//			System.out.println("SQL 오류 : " + e.getMessage());
//		} finally {
//			rsClose();
//		}
//		return res;
//	}
//
//	// 리뷰 내역 전체 리스트 가져오기
//	public ArrayList<ReviewVO> getReviewSearch(int idx, String part) {
//		ArrayList<ReviewVO> rVos = new ArrayList<ReviewVO>();
//		try {
//			//sql = "select * from review where part = ? and partIdx = ? order by idx desc";
//			sql = "select * from (select * from review where part = ? and partIdx = ?) as v left join reviewReply r "  // partIdx는 원본글
//					+ "on v.idx = r.reviewIdx order by v.idx desc, r.replyIdx desc";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, part);
//			pstmt.setInt(2, idx);
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				ReviewVO vo = new ReviewVO();
//				vo.setIdx(rs.getInt("idx"));
//				vo.setPart(rs.getString("part"));
//				vo.setPartIdx(rs.getInt("partIdx"));
//				vo.setMid(rs.getString("mid"));
//				vo.setNickName(rs.getString("nickName"));
//				vo.setStar(rs.getInt("star"));
//				vo.setContent(rs.getString("content"));				
//				vo.setrDate(rs.getString("rDate"));
//				
//				vo.setReplyIdx(rs.getInt("replyIdx"));
//				vo.setReplyMid(rs.getString("replyMid"));
//				vo.setReplyNickName(rs.getString("replyNickName"));
//				vo.setReplyRDate(rs.getString("replyRDate"));
//				vo.setReplyContent(rs.getString("replyContent"));
//				
//				rVos.add(vo);
//			}
//		} catch (SQLException e) {
//			System.out.println("SQL 오류 : " + e.getMessage());
//		} finally {
//			rsClose();
//		}
//		return rVos;
//	}
//
//	//리뷰 삭제하기
//	public int setReviewDelete(int idx) {
//		int res = 0;
//		try {
//			sql = "delete from review where idx = ?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, idx);
//			res = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			System.out.println("SQL 오류 : " + e.getMessage());
//		} finally {
//			pstmtClose();
//		}
//		return res;
//	}
//
//	//리뷰 댓글 저장하기
//	public int setReviewReplyInputOk(ReviewVO vo) {
//		int res = 0;
//		try {
//			sql = "insert into reviewReply values (default,?,?,?,default,?)";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, vo.getIdx());
//			pstmt.setString(2, vo.getReplyMid());
//			pstmt.setString(3, vo.getReplyNickName());
//			pstmt.setString(4, vo.getReplyContent());
//			res = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			System.out.println("SQL 오류 : " + e.getMessage());
//		} finally {
//			pstmtClose();
//		}
//		return res;
//	}
}
