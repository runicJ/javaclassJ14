package admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.review.ReviewVO;
import common.GetConn;
import memeber.MemberVO;

public class AdminDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql = "";
	MemberVO vo = null;
	
	public void connClose() {
		if(conn != null) {
			try {
				conn.close();
			} catch (Exception e) {}
		}
	}
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {}
		}
	}
	
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
			sql = "select count(*) as cnt from member2 where startDate = curdate()";
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
	
	// 리뷰 내역 전체 리스트 가져오기
	public ArrayList<ReviewVO> getReviewSearch(int tIdx, String part) {
		ArrayList<ReviewVO> rVos = new ArrayList<ReviewVO>();
		try {
	        sql = "SELECT r.*, m.userInfo as userInfo, m.photo as photo FROM review r JOIN member2 m ON r.mid = m.mid "
	        	+ "WHERE r.part = ? AND r.partIdx = ? ORDER BY r.rIdx DESC";
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