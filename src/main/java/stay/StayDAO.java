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
	public Map<String, Object> setStayInputOk(StayVO vo, FacilityVO fVo) {
	    Map<String, Object> result = new HashMap<>();
	    int res = 0, sIdx = 0;
	    try {
	        conn.setAutoCommit(false);  // 트랜잭션 시작

	        // 숙소 정보 등록
	        sql = "INSERT INTO stay VALUES (default, ?, ?, ?, default, ?, ?, ?, ?, ?, default, default)";
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

	        if (rs.next()) {
	            sIdx = rs.getInt(1);
	            fVo.setsIdx(sIdx);
	        }

	        // 시설 정보 등록
	        if (sIdx > 0) {
	            sql = "INSERT INTO facility VALUES (default, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, fVo.getBed());
	            pstmt.setInt(2, fVo.getToilet());
	            pstmt.setString(3, fVo.getWifi());
	            pstmt.setString(4, fVo.getAc());
	            pstmt.setString(5, fVo.getParking());
	            pstmt.setString(6, fVo.getPet());
	            pstmt.setString(7, fVo.getKitchen());
	            pstmt.setString(8, fVo.getWashing());
	            pstmt.setInt(9, sIdx);
	            pstmt.executeUpdate();
	        }

	        conn.commit();  // 트랜잭션 커밋
	        result.put("res", res);
	        result.put("sIdx", sIdx);
	    } catch (SQLException e) {
	        System.out.println("SQL 오류 : " + e.getMessage());
	        try {
	            if (conn != null) conn.rollback();  // 오류 발생 시 롤백
	        } catch (SQLException e2) {
	            System.out.println("롤백 중 오류 발생: " + e2.getMessage());
	        }
	    } finally {
	        rsClose();
	    }
	    return result;
	}


	public StayVO getStayIdxDetail(int sIdx) {
		try {
			sql="select * from stay where sIdx=?";
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
	    PreparedStatement pstmtFacility = null;
	    ResultSet rsFacility = null;
		try {
			sql="select * from facility where sIdx=?";
			pstmtFacility = conn.prepareStatement(sql);
			pstmtFacility.setInt(1, sIdx);
			rsFacility  = pstmtFacility.executeQuery();
			if(rsFacility .next()) {
	            fVo = new FacilityVO();
	            fVo.setfIdx(rsFacility.getInt("fIdx"));
	            fVo.setBed(rsFacility.getInt("bed"));
	            fVo.setToilet(rsFacility.getInt("toilet"));
	            fVo.setWifi(rsFacility.getString("wifi"));
	            fVo.setAc(rsFacility.getString("ac"));
	            fVo.setParking(rsFacility.getString("parking"));
	            fVo.setPet(rsFacility.getString("pet"));
	            fVo.setKitchen(rsFacility.getString("kitchen"));
	            fVo.setWashing(rsFacility.getString("washing"));
	            fVo.setsIdx(rsFacility.getInt("sIdx"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			if(rsFacility != null) {
				try {
					rsFacility.close();
				} catch (SQLException e) {}
			}
			if(pstmtFacility != null) {
				try {
					pstmtFacility.close();
				} catch (SQLException e) {}
			}
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

	public ArrayList<StayVO> getStayList(int startIndexNo, int pageSize, String contentsShow, String search, String searchString) {
		ArrayList<StayVO> vos = new ArrayList<StayVO>();
		try {
			if(search == null || search.equals("")) {
				if(contentsShow.equals("adminOK")) {
					sql = "select * FROM stay ORDER BY sIdx DESC limit ?,?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, startIndexNo);
					pstmt.setInt(2, pageSize);
				}
				else {
					sql = "select * FROM stay WHERE sDel = 'NO' ORDER BY sIdx DESC limit ?,?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, startIndexNo);
					pstmt.setInt(2, pageSize);
				}
			}
			else {
				if(contentsShow.equals("adminOK")) {
					sql = "select * FROM stay where "+search+" like ? ORDER BY sIdx DESC limit ?,?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%"+searchString+"%");
					pstmt.setInt(2, startIndexNo);
					pstmt.setInt(3, pageSize);
				}
				else {
					sql = "select * FROM stay WHERE sDel = 'NO' and "+search+" like ? ORDER BY sIdx DESC limit ?,?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%"+searchString+"%");
					pstmt.setInt(2, startIndexNo);
					pstmt.setInt(3, pageSize);
				}
			}
			rs = pstmt.executeQuery();

			while(rs.next()) {
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

	            // 추가할 시설 정보 가져오기
	            FacilityVO fVo = getStayIdxFacility(rs.getInt("sIdx"));
	            vo.setFacility(fVo);

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
			sql = "select * from stay order by star desc, sIdx desc limit 4";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
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
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	public int getTotRecCnt(String contentsShow, String search, String searchString) {
		int totRecCnt = 0;
		try {
			if(search == null || search.equals("")) {
				if(contentsShow.equals("adminOK")) {
				  sql = "select count(*) as cnt from stay";
				  pstmt = conn.prepareStatement(sql);
				}
				else {
					sql = "select count(*) as cnt from stay where sDel = 'NO'";
					pstmt = conn.prepareStatement(sql);
				}
			}
			else {
				if(contentsShow.equals("adminOK")) {
					sql = "select count(*) as cnt from stay where "+search+" like ?";
				  pstmt = conn.prepareStatement(sql);
				  pstmt.setString(1, "%"+searchString+"%");
				}
				else {
					sql = "select sum(a.cnt) as cnt from where sDel = 'NO' and "+search+" like ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%"+searchString+"%");
				}
			}
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

	public int StayBookingCheck(int sIdx, String checkInStr, String checkOutStr) {
        int res = 0;
        try {
            String sql = "SELECT COUNT(*) FROM booking WHERE sIdx = ? AND (checkIn < ? AND checkOut > ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, sIdx);
            pstmt.setString(2, checkOutStr);
            pstmt.setString(3, checkInStr);
            rs = pstmt.executeQuery();
            if (rs.next()) {
            	res = rs.getInt(1);
            }
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
        return res;
    }

	public int StayBookingOk(BookingVO vo) {
		int res = 0;
		try {
			sql = "insert into booking values(default,?,?,default,?,?,?,?,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getsIdx());
			pstmt.setString(2, vo.getMid());
			pstmt.setString(3, vo.getCheckIn());
			pstmt.setString(4, vo.getCheckOut());
			pstmt.setInt(5, vo.getGuestNum());
			pstmt.setInt(6, vo.getTotal());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	public boolean checkMemberWish(String sMid, int sIdx) {
	    boolean result = false;
	    try {
	        sql = "select count(*) as count from stayWish where mid=? and sIdx=?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, sMid);
	        pstmt.setInt(2, sIdx);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            result = rs.getInt("count") > 0;
	        }
	    } catch (SQLException e) {
	        System.out.println("SQL 오류 : " + e.getMessage());
	    } finally {
	        rsClose();
	    }
	    return result;
	}

    // 좋아요 상태를 토글
    public void toggleWish(String sMid, int sIdx, boolean like) {
        try {
        	sql = like ? "INSERT INTO stayWish VALUES (default, ?, ?)" :
                "DELETE FROM stayWish WHERE mid = ? AND sIdx = ?";
        	pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, sMid);
            pstmt.setInt(2, sIdx);
            pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
    }
}
