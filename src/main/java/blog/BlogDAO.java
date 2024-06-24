package blog;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumMap;
import java.util.Map;
import java.util.stream.Collectors;

import blog.BlogVO.SortType;
import common.GetConn;
import memeber.MemberVO;
import stay.StayVO;

public class BlogDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql = "";
	BlogVO vo = null;
	
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

	// 여행블로그 목록
	public ArrayList<BlogVO> getBlogList(int startIndexNo, int pageSize, String part) {
		ArrayList<BlogVO> vos = new ArrayList<BlogVO>();
		try {
			sql = "select *, datediff(now(), tDate) as date_diff, timestampdiff(hour, tDate, now()) as hour_diff, "
					+ "(SELECT COUNT(*) FROM review r WHERE r.partIdx = t.tIdx AND r.part = 'travelog') AS reviewCnt "
					+ "from travelog t order by "+part+" desc, t.tIdx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new BlogVO();
				vo.settIdx(rs.getInt("tIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.settPhoto(rs.getString("tPhoto"));
				vo.setSort(SortType.valueOf(rs.getString("sort")));
				vo.setTitle(rs.getString("title"));
				vo.setResidence(rs.getString("residence"));
				vo.settDate(rs.getString("tDate"));
				vo.setViewCnt(rs.getInt("viewCnt"));
				vo.setLikedCnt(rs.getInt("likedCnt"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.settContent(rs.getString("tContent"));
				vo.setComplaint(rs.getString("complaint"));
				
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDate_diff(rs.getInt("date_diff"));
				
				vo.setReviewCnt(rs.getInt("reviewCnt"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	
	// 여행블로그 글 총 갯수
	public int getTotRecCnt(String mid, String keyword) {
        int totRecCnt = 0;
        try {
            if (mid.equals("admin")) {
                if (keyword.equals("")) {
                    sql = "SELECT COUNT(*) AS cnt FROM travelog";
                } 
                else {
                    sql = "SELECT COUNT(*) AS cnt FROM travelog WHERE title LIKE ? OR nickName LIKE ? OR tContent LIKE ?";
                }
            } else {
                if (keyword.equals("")) {
                    sql = "SELECT COUNT(*) AS cnt FROM travelog WHERE openSw = 'OK' AND complaint = 'NO'";
                } 
                else {
                    sql = "SELECT COUNT(*) AS cnt FROM travelog WHERE (title LIKE ? OR nickName LIKE ? OR tContent LIKE ?) AND openSw = 'OK' AND complaint = 'NO'";
                }
            }
            pstmt = conn.prepareStatement(sql);
            if (!keyword.equals("")) {
                pstmt.setString(1, "%" + keyword + "%");
                pstmt.setString(2, "%" + keyword + "%");
                pstmt.setString(3, "%" + keyword + "%");
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

	public BlogVO getBlogDetail(int tIdx) {
		try {
			sql = "select *, datediff(now(), tDate) as date_diff, timestampdiff(hour, tDate, now()) as hour_diff,"
					+ "(SELECT COUNT(*) FROM review r WHERE r.partIdx = t.tIdx AND r.part = 'travelog') AS reviewCnt "
					+ " from travelog t where tIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tIdx);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				vo = new BlogVO();
				vo.settIdx(rs.getInt("tIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.settPhoto(rs.getString("tPhoto"));
				vo.setSort(SortType.valueOf(rs.getString("sort")));
				vo.setTitle(rs.getString("title"));
				vo.setResidence(rs.getString("residence"));
				vo.settDate(rs.getString("tDate"));
				vo.setViewCnt(rs.getInt("viewCnt"));
				vo.setLikedCnt(rs.getInt("likedCnt"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.settContent(rs.getString("tContent"));
				vo.setComplaint(rs.getString("complaint"));
				
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDate_diff(rs.getInt("date_diff"));
				vo.setReviewCnt(rs.getInt("reviewCnt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 여행블로그 글 등록
	public int setBlogInputOk(BlogVO vo) {
		int res = 0;
		try {
			sql = "insert into travelog values (default,?,?,?,?,?,?,default,default,default,?,?,?,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.gettPhoto());
			pstmt.setString(4, vo.getSort().name());
			pstmt.setString(5, vo.getTitle());
			pstmt.setString(6, vo.getResidence());
			pstmt.setString(7, vo.getOpenSw());
			pstmt.setString(8, vo.getHostIp());
			pstmt.setString(9, vo.gettContent());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	// 블로그 글 조회수 증가
	public void setBlogViewCnt(int tIdx) {
		try {
			sql = "update travelog set viewCnt = viewCnt + 1 where tIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tIdx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}
	
	// 블로그 글 삭제하기
	public int setBlogDelete(int tIdx) {
		int res = 0;
		try {
			sql = "delete from travelog where tIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tIdx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	public ArrayList<BlogVO> getVestThreeBlog() {
		ArrayList<BlogVO> vos = new ArrayList<BlogVO>();
		try {
			sql = "select *, datediff(now(), tDate) as date_diff, timestampdiff(hour, tDate, now()) as hour_diff, "
					+ "(SELECT COUNT(*) FROM review r WHERE r.partIdx = t.tIdx AND r.part = 'travelog') AS reviewCnt "
					+ "from travelog t order by t.viewCnt desc, t.likedCnt desc, reviewCnt desc, tIdx desc limit 3";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo = new BlogVO();
				vo.settIdx(rs.getInt("tIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.settPhoto(rs.getString("tPhoto"));
				vo.setSort(SortType.valueOf(rs.getString("sort")));
				vo.setTitle(rs.getString("title"));
				vo.setResidence(rs.getString("residence"));
				vo.settDate(rs.getString("tDate"));
				vo.setViewCnt(rs.getInt("viewCnt"));
				vo.setLikedCnt(rs.getInt("likedCnt"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.settContent(rs.getString("tContent"));
				vo.setComplaint(rs.getString("complaint"));
				
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDate_diff(rs.getInt("date_diff"));
				vo.setReviewCnt(rs.getInt("reviewCnt"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	
	// 이전글/다음글 idx,title 가져오기
	public BlogVO getPreNextSearch(int tIdx, String str) {
		BlogVO vo = new BlogVO();
		try {
			if(str.equals("preVo")) sql = "select tIdx, title, tPhoto from travelog where tIdx < ? order by tIdx desc limit 1";
			else sql = "select tIdx, title, tPhoto from travelog where tIdx > ? order by tIdx limit 1";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tIdx);
			rs = pstmt.executeQuery();
	
			if(rs.next()) {
				vo.settIdx(rs.getInt("tIdx"));
				vo.setTitle(rs.getString("title"));
				vo.settPhoto(rs.getString("tPhoto"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	public ArrayList<BlogVO> getSortCntAll() {
        Map<SortType, Integer> counts = new EnumMap<>(SortType.class);
        Arrays.stream(SortType.values()).forEach(sort -> counts.put(sort, 0));

        try {        	
        	sql = "SELECT sort, COUNT(*) as cnt FROM travelog GROUP BY sort";
        	pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                SortType sort = SortType.valueOf(rs.getString("sort"));
                counts.put(sort, rs.getInt("cnt"));
            }
        } catch (SQLException e) {
            System.out.println("SQL 오류 : " + e.getMessage());
        } finally {
            rsClose();
        }

        // 스트림을 사용하여 객체 생성
        return counts.entrySet().stream()
                .map(entry -> {
                    BlogVO vo = new BlogVO();
                    vo.setSort(entry.getKey());
                    vo.setSortCnt(entry.getValue());
                    return vo;
                })
                .collect(Collectors.toCollection(ArrayList::new));
    }
	
//	public ArrayList<BlogVO> getSortCntAll() {
//	    String sql = "SELECT s.sort, COUNT(t.sort) AS cnt FROM sortType s LEFT JOIN travelog t ON s.sort = t.sort GROUP BY s.sort";
//	    ArrayList<BlogVO> result = new ArrayList<>();
//
//	    try {
//	    	pstmt = conn.prepareStatement(sql);
//	        rs = pstmt.executeQuery();
//
//	        while (rs.next()) {
//	            BlogVO vo = new BlogVO();
//	            vo.setSort(SortType.valueOf(rs.getString("sort")));
//	            vo.setSortCnt(rs.getInt("cnt"));
//	            result.add(vo);
//	        }
//	    } catch (SQLException e) {
//	        System.out.println("SQL 오류 : " + e.getMessage());
//	    }
//
//	    return result;
//	}

	public boolean checkMemberLiked(String sMid, int tIdx) {
	    boolean result = false;
	    try {
	        sql = "select count(*) as count from blogLiked where mid=? and tIdx=?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, sMid);
	        pstmt.setInt(2, tIdx);
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
	public void toggleLiked(String sMid, int tIdx, boolean like) {
	    try {
	        if (like) {
	            sql = "INSERT INTO blogLiked VALUES (default, ?, ?)";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, sMid);
	            pstmt.setInt(2, tIdx);
	            pstmt.executeUpdate();

	            sql = "UPDATE travelog SET likedCnt = likedCnt + 1 WHERE tIdx = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, tIdx);
	            pstmt.executeUpdate();
	        } else {
	            sql = "DELETE FROM blogLiked WHERE mid = ? AND tIdx = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, sMid);
	            pstmt.setInt(2, tIdx);
	            pstmt.executeUpdate();

	            sql = "UPDATE travelog SET likedCnt = likedCnt - 1 WHERE tIdx = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, tIdx);
	            pstmt.executeUpdate();
	        }
	    } catch (SQLException e) {
	        System.out.println("SQL 오류 : " + e.getMessage());
	    } finally {
	        pstmtClose();
	    }
	}

	public ArrayList<BlogVO> getBlogSearch(int startIndexNo, int pageSize, String keyword) {
		ArrayList<BlogVO> vos = new ArrayList<BlogVO>();
		try {
            sql = "SELECT *, DATEDIFF(NOW(), tDate) AS date_diff, TIMESTAMPDIFF(HOUR, tDate, NOW()) AS hour_diff, "
                    + "(SELECT COUNT(*) FROM review r WHERE r.partIdx = t.tIdx AND r.part = 'travelog') AS reviewCnt "
                    + "FROM travelog t WHERE title LIKE ? OR nickName LIKE ? OR tContent LIKE ? "
                    + "ORDER BY t.tIdx DESC LIMIT ?, ?";
			pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, "%" + keyword + "%");
	        pstmt.setString(2, "%" + keyword + "%");
	        pstmt.setString(3, "%" + keyword + "%");
            pstmt.setInt(4, startIndexNo);
            pstmt.setInt(5, pageSize);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo = new BlogVO();
				vo.settIdx(rs.getInt("tIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.settPhoto(rs.getString("tPhoto"));
				vo.setSort(SortType.valueOf(rs.getString("sort")));
				vo.setTitle(rs.getString("title"));
				vo.setResidence(rs.getString("residence"));
				vo.settDate(rs.getString("tDate"));
				vo.setViewCnt(rs.getInt("viewCnt"));
				vo.setLikedCnt(rs.getInt("likedCnt"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.settContent(rs.getString("tContent"));
				vo.setComplaint(rs.getString("complaint"));
				
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDate_diff(rs.getInt("date_diff"));
	            vo.setReviewCnt(rs.getInt("reviewCnt"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	public ArrayList<BlogVO> getNoticeList() {
		ArrayList<BlogVO> vos = new ArrayList<BlogVO>();
		try {
			sql = "select * from travelog where sort='공지사항' order by tIdx desc limit 3";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo = new BlogVO();
				vo.settIdx(rs.getInt("tIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.settPhoto(rs.getString("tPhoto"));
				vo.setSort(SortType.valueOf(rs.getString("sort")));
				vo.setTitle(rs.getString("title"));
				vo.setResidence(rs.getString("residence"));
				vo.settDate(rs.getString("tDate"));
				vo.setViewCnt(rs.getInt("viewCnt"));
				vo.setLikedCnt(rs.getInt("likedCnt"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.settContent(rs.getString("tContent"));
				vo.setComplaint(rs.getString("complaint"));
								
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
}
