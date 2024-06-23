package admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.review.ReviewVO;
import memeber.MemberVO;

public class AdminDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql = "";
	MemberVO vo = null;
	
	public AdminDAO() {
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
			} catch (Exception e) {}
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
		pstmtClose();
	}
	
	// 회원 전체/부분 리스트
	public ArrayList<MemberVO> getMemberList(int startIndexNo, int pageSize, String part) {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		try {			
			sql = "select *, timestampdiff(day, lastDate, now()) as deleteDiff from member2 order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				vo = new MemberVO();
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
				
				vo.setDeleteDiff(rs.getInt("deleteDiff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 회원 DB에서 삭제처리하기
	public int MemberDeleteOk(int idx) {
		int res = 0;
		try {
			sql = "delete from member2 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 신규회원 건수
	public int getNewMemberCnt() {
		int mCount = 0;
		try {
			sql = "select count(*) as cnt from member2 where level = 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			mCount = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return mCount;
	}
	
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
	
	// 리뷰를 작성했는지 여부 체크
	public int getReviewSearch(ReviewVO vo) {
		int res = 0;
		try {
			sql = "select * from review where part = ? and partIdx = ? and mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPart());
			pstmt.setInt(2, vo.getPartIdx());
			pstmt.setString(3, vo.getMid());
			rs = pstmt.executeQuery();
			if(rs.next()) res = 1;  // 이미 이 아이디로 리뷰를 작성했다
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return res;
	}

	// 리뷰 내역 전체 리스트 가져오기
	public ArrayList<ReviewVO> getReviewSearch(int tIdx, String part) {
		ArrayList<ReviewVO> rVos = new ArrayList<ReviewVO>();
		try {
	        sql = "SELECT r.*, m.userInfo, m.photo FROM review r JOIN member2 m ON r.mid = m.mid "
	        	+ "WHERE r.part = ? AND r.partIdx = ? ORDER BY r.rIdx DESC";
//			sql = "select * from (select * from review where part = ? and partIdx = ?) as v left join reply r "  // partIdx는 원본글
//					+ "on v.idx = r.reviewIdx order by v.idx desc, r.replyIdx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, part);
			pstmt.setInt(2, tIdx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewVO vo = new ReviewVO();
				vo.setrIdx(rs.getInt("rIdx"));
				vo.setPart(rs.getString("part"));
				vo.setPartIdx(rs.getInt("partIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setStar(rs.getInt("star"));
				vo.setrContent(rs.getString("rContent"));				
				vo.setrDate(rs.getString("rDate"));
				vo.setPurpose(rs.getString("purpose"));
				
	            vo.setUserInfo(rs.getString("userInfo"));
	            vo.setPhoto(rs.getString("photo"));
				
				rVos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return rVos;
	}

	//리뷰 삭제하기
	public int setReviewDelete(int rIdx) {
		int res = 0;
		try {
			sql = "delete from review where rIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rIdx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	public int setReviewInputOk(ReviewVO vo) {
		int res = 0;
		try {
            String sql = "INSERT INTO review (part, partIdx, mid, nickName, star, rContent, rDate, purpose, bIdx) VALUES (?, ?, ?, ?, ?, ?, default, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, vo.getPart());
            pstmt.setInt(2, vo.getPartIdx());
            pstmt.setString(3, vo.getMid());
            pstmt.setString(4, vo.getNickName());
            pstmt.setInt(5, vo.getStar());
            pstmt.setString(6, vo.getrContent());
            pstmt.setString(7, vo.getPurpose());
            if (vo.getbIdx() == 0) {
                pstmt.setNull(8, java.sql.Types.INTEGER);
            } else {
                pstmt.setInt(8, vo.getbIdx());
            }
            res = pstmt.executeUpdate();

            if ("stay".equals(vo.getPart()) && vo.getbIdx() != 0) {
                String updateBookingSQL = "UPDATE bookings SET status = 'DONE' WHERE id = ?";
                pstmt = conn.prepareStatement(updateBookingSQL);
                pstmt.setInt(1, vo.getbIdx());
                pstmt.executeUpdate();
            }
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
}