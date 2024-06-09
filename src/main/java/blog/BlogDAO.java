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
import memeber.MemberVO;
import stay.StayVO;

public class BlogDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql = "";
	BlogVO vo = null;
	
	public BlogDAO() {
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

	// 여행블로그 목록
	public ArrayList<BlogVO> getBlogList(int startIndexNo, int pageSize, String part) {
		ArrayList<BlogVO> vos = new ArrayList<BlogVO>();
		try {
			sql = "select *, datediff(now(), tDate) as date_diff, timestampdiff(hour, tDate, now()) as hour_diff "
					+ "from travelog order by "+part+" desc limit ?,?";
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
	public int getTotRecCnt(String contentsShow, String part) {
		int totRecCnt = 0;
		try {
			if(contentsShow.equals("adminOK")) {
			  sql = "select count(*) as cnt from travelog";
			  pstmt = conn.prepareStatement(sql);
			}
			else {
				sql = "select sum(a.cnt) as cnt from (select count(*) as cnt from travelog where openSW = 'OK' and complaint = 'NO' union select count(*) as cnt from travelog where mid = ? and (openSW = 'NO' or complaint = 'OK')) as a";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, contentsShow);
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
			sql = "select *, datediff(now(), tDate) as date_diff, timestampdiff(hour, tDate, now()) as hour_diff from travelog where tIdx = ?";
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
	
	// 블로그 글 좋아요 수 증가/감소 처리
	public void setBlogLikedCnt(int tIdx, int likedCnt) {
		try {
			sql = "update travelog set likedCnt = likedCnt + ? where tIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, likedCnt);
			pstmt.setInt(2, tIdx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	public ArrayList<BlogVO> getVestThreeBlog() {
		ArrayList<BlogVO> vos = new ArrayList<BlogVO>();
		try {
			sql = "select *, datediff(now(), tDate) as date_diff, timestampdiff(hour, tDate, now()) as hour_diff "
					+ "from travelog order by viewCnt desc, likedCnt desc, tIdx desc limit 3";
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

//	public ArrayList<BlogVO> getSortCntAll() {
//        Map<SortType, Integer> counts = new EnumMap<>(SortType.class);
//        Arrays.stream(SortType.values()).forEach(sort -> counts.put(sort, 0));
//
//        try {        	
//        	sql = "SELECT sort, COUNT(*) as cnt FROM travelog GROUP BY sort";
//        	pstmt = conn.prepareStatement(sql);
//            rs = pstmt.executeQuery();
//
//            while (rs.next()) {
//                SortType sort = SortType.valueOf(rs.getString("sort"));
//                counts.put(sort, rs.getInt("cnt"));
//            }
//        } catch (SQLException e) {
//            System.out.println("SQL 오류 : " + e.getMessage());
//        } finally {
//            rsClose();
//        }
//
//        // 스트림을 사용하여 객체 생성
//        return counts.entrySet().stream()
//                .map(entry -> {
//                    BlogVO vo = new BlogVO();
//                    vo.setSort(entry.getKey());
//                    vo.setSortCnt(entry.getValue());
//                    return vo;
//                })
//                .collect(Collectors.toCollection(ArrayList::new));
//    }
	
	public ArrayList<BlogVO> getSortCntAll() {
	    String sql = "SELECT s.sort, COUNT(t.sort) AS cnt FROM sortType s LEFT JOIN travelog t ON s.sort = t.sort GROUP BY s.sort";
	    ArrayList<BlogVO> result = new ArrayList<>();

	    try {
	    	pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            BlogVO vo = new BlogVO();
	            vo.setSort(SortType.valueOf(rs.getString("sort")));
	            vo.setSortCnt(rs.getInt("cnt"));
	            result.add(vo);
	        }
	    } catch (SQLException e) {
	        System.out.println("SQL 오류 : " + e.getMessage());
	    }

	    return result;
	}

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
        	sql = like ? "INSERT INTO blogLiked VALUES (default, ?, ?)" :
                "DELETE FROM blogLiked WHERE mid = ? AND tIdx = ?";
        	pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, sMid);
            pstmt.setInt(2, tIdx);
            pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
    }
}
