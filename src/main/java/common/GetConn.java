package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConn {
	private static Connection conn = null;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/javaclass14";
	private String user = "root";
	private String password = "1234";
	
	private static GetConn instance = new GetConn();
	
	private GetConn() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패 : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("데이터베이스 연결 실패 : " + e.getMessage());
		}
	}
	
	public static GetConn getInstance() {  // 정적 메소드(얘를 어떻게 불러쓸건데) public static 타입 이름
		return instance;  // 사용은 DAO에서 하겠지
	}
	
	public static Connection getConn() {  // DAO에서 얘를 불러서 conn 사용
		return conn;  // 위에 conn 객체를 넘겨주세요
	}
}
