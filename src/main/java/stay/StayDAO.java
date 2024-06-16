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

import common.GetConn;
import memeber.MemberVO;

public class StayDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql = "";
	StayVO vo = null;
	FacilityVO fVo = null;
	
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

	// 숙소 상세보기
	public StayVO getStayIdxDetail(int sIdx, String contentsShow) {
		try {
			if(contentsShow.equals("admin") || contentsShow.equals("guest")) {
		        sql = "SELECT s.*, " +
		                "(SELECT COUNT(*) FROM stayWish w WHERE w.sIdx = s.sIdx AND w.mid = ?) AS isWished, " +
		                "(SELECT COUNT(*) FROM stayWish w WHERE w.sIdx = s.sIdx) AS wishCnt " +
		                "FROM stay s WHERE s.sIdx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, contentsShow);
				pstmt.setInt(2, sIdx);
			}
			else {
				sql="select * from stay where sIdx=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, sIdx);				
			}
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
				
				vo.setIsWished(rs.getInt("isWished"));
				vo.setWishCnt(rs.getInt("wishCnt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	// 숙소별 시설 정보 가져오기
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
	
	// 숙소 판매 중지 처리
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

	// 숙소리스트 가져오기(시설정보도 같이)
	public ArrayList<StayVO> getStayList(int startIndexNo, int pageSize, String contentsShow, String search, String searchString) {
		ArrayList<StayVO> vos = new ArrayList<StayVO>();
		try {
			if(search == null || search.equals("")) {
				if(contentsShow.equals("adminOK")) {
					sql = "select s.*, (SELECT COUNT(*) FROM stayWish w WHERE w.sIdx = s.sIdx AND w.mid = ?) AS isWished "
							+ "FROM stay s ORDER BY s.sIdx DESC limit ?,?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, contentsShow);
					pstmt.setInt(2, startIndexNo);
					pstmt.setInt(3, pageSize);
				}
				else if(!contentsShow.equals("guest")) {
					sql = "SELECT s.*, (SELECT COUNT(*) FROM stayWish w WHERE w.sIdx = s.sIdx AND w.mid = ?) AS isWished "
							+ "FROM stay s WHERE s.sDel = 'NO' ORDER BY s.sIdx DESC LIMIT ?, ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, contentsShow);
					pstmt.setInt(2, startIndexNo);
					pstmt.setInt(3, pageSize);
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
	            
	            if(!contentsShow.equals("guest")) {
	            	vo.setIsWished(rs.getInt("isWished"));
	            }

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

	// top 4 숙소
	public ArrayList<StayVO> getVestFourStay(String contentsShow) {
		ArrayList<StayVO> vos = new ArrayList<StayVO>();
	    try {
	        if (contentsShow.equals("adminOK")) {
	            sql = "SELECT s.*, (SELECT COUNT(*) FROM stayWish w WHERE w.sIdx = s.sIdx AND w.mid = ?) AS isWished, " +
	                  "(SELECT COUNT(*) FROM booking b WHERE b.sIdx = s.sIdx) AS bookingCnt " +
	                  "FROM stay s " +
	                  "ORDER BY bookingCnt DESC, s.star DESC, s.sIdx DESC LIMIT 4";
	            pstmt = conn.prepareStatement(sql);
	        } else if (!contentsShow.equals("guest")) {
	            sql = "SELECT s.*, (SELECT COUNT(*) FROM stayWish w WHERE w.sIdx = s.sIdx AND w.mid = ?) AS isWished, " +
	                  "(SELECT COUNT(*) FROM booking b WHERE b.sIdx = s.sIdx) AS bookingCnt " +
	                  "FROM stay s " +
	                  "WHERE s.sDel = 'NO' " +
	                  "ORDER BY bookingCnt DESC, s.star DESC, s.sIdx DESC " +
	                  "LIMIT 4";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, contentsShow);
	        } else {
	            sql = "SELECT s.*, (SELECT COUNT(*) FROM stayWish w WHERE w.sIdx = s.sIdx) AS wishCount, " +
	                  "(SELECT COUNT(*) FROM booking b WHERE b.sIdx = s.sIdx) AS bookingCnt " +
	                  "FROM stay s " +
	                  "WHERE s.sDel = 'NO' " +
	                  "ORDER BY bookingCnt DESC, s.star DESC, s.sIdx DESC " +
	                  "LIMIT 4";
	            pstmt = conn.prepareStatement(sql);
	        }
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            StayVO vo = new StayVO();
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

	            if (!contentsShow.equals("guest")) {
	                vo.setIsWished(rs.getInt("isWished"));
	            }

	            vos.add(vo);
	        }
	    } catch (SQLException e) {
	        System.out.println("SQL 오류 : " + e.getMessage());
	    } finally {
	    	rsClose();
	    }
	    return vos;
	}

	// 숙소 개수 구하기
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

	// 회원별 숙소 위시 여부 확인
	public boolean checkMemberWish(String sMid, int sIdx) {
	    boolean result = false;
	    try {
	    	conn.setAutoCommit(false); // 트랜잭션 시작
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

    // 숙소 위시 상태를 토글
    public void toggleWish(String sMid, int sIdx, boolean like) {
        try {
        	sql = like ? "INSERT INTO stayWish VALUES (default, ?, ?)" :
                "DELETE FROM stayWish WHERE mid = ? AND sIdx = ?";
        	pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, sMid);
            pstmt.setInt(2, sIdx);
            pstmt.executeUpdate();
            conn.commit(); // 트랜잭션 커밋
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException e2) {
                	e2.printStackTrace();
                }
            }
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
    }
    
	// 숙소 예약 여부 확인
	public int StayBookingCheck(int sIdx, String checkInStr, String checkOutStr) {
        int res = 0;
        try {
            String sql = "select count(*) FROM booking WHERE sIdx = ? AND (checkIn < ? AND checkOut > ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, sIdx);
            pstmt.setString(2, checkOutStr);
            pstmt.setString(3, checkInStr);
            rs = pstmt.executeQuery();
            if (rs.next()) {
            	res = rs.getInt(1);  // count(*)의 행의 개수
            }
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
        return res;
    }

	// 숙소 예약하기
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
}
