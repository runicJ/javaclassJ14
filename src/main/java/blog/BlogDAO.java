package blog;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
					+ "from travelog order by tIdx desc limit ?,?";
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


//	// 방명록 글 삭제하기
//	public int setGuestDelete(int idx) {
//		int res = 0;
//		try {
//			sql = "delete from guest where idx=?";
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
	
	// 여행블로그 글 총 갯수
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from travelog";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();  // 값이 무조건 있음(null이어도 값이 0으로 옴)
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return totRecCnt;
	}

	public BlogVO getBlogDetail(int tIdx) {
		return null;
	}

	// 여행블로그 글 등록
	public int setBlogInputOk(BlogVO vo) {
		int res = 0;
		try {
			sql = "insert into travelog values (default,?,?,?,?,?,default,default,default,?,?,?,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.gettPhoto());
			pstmt.setString(4, vo.getTitle());
			pstmt.setString(5, vo.getResidence());
			pstmt.setString(6, vo.getOpenSw());
			pstmt.setString(7, vo.getHostIp());
			pstmt.setString(8, vo.gettContent());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

//	// 로그인한 회원이 방명록에 올린글 리스트 가져오기
//	public ArrayList<BlogVO> getMemberGuestSearch(String mid, String name, String nickName) {
//		ArrayList<BlogVO> vos = new ArrayList<BlogVO>();
//		try {
//			sql = "select * from guest where name=? or name=? or name=? order by idx desc";  // 게시글의 name이 mid일지도, name일지도, 닉네임일지도  // 자료도 가져옴 // 건수만 하려면 count 하면 됨
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, mid);
//			pstmt.setString(2, name);
//			pstmt.setString(3, nickName);
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				vo = new BlogVO();
//				vo.setIdx(rs.getInt("idx"));
//				vo.setName(rs.getString("name"));
//				vo.setContent(rs.getString("content"));
//				vo.setEmail(rs.getString("email"));
//				vo.setHomePage(rs.getString("homePage"));
//				vo.setVisitDate(rs.getString("visitDate"));
//				vo.setHostIp(rs.getString("hostIp"));
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
//	// 방명록 글 갯수
//	public int getMemberGuestCount(String mid, String name, String nickName) {
//		int guestCnt = 0;
//		try {
//			sql = "select count(df) as cnt from (select date_format(visitDate, '%Y%m%d') as df from guest where name=? or name=? or name=? group by df) as groupBy";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, mid);
//			pstmt.setString(2, name);
//			pstmt.setString(3, nickName);
//			rs = pstmt.executeQuery();
////			rs.next();
////			guestCnt = rs.getInt("cnt");
//	        if (rs.next()) {
//	        	guestCnt = rs.getInt("cnt");
//	        }
//		} catch (SQLException e) {
//			System.out.println("SQL 오류 : " + e.getMessage());
//		} finally {
//			rsClose();
//		}
//		return guestCnt;
//	}
}
