package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// 디자인 패턴
// GoF

// 싱글톤 패턴
// 1. private 생성자
// 2. static 자기 자신의 멤버변수
// 3. public static getInstance() 자기자신의 객체 반환

public class MakeConnection {
	private static MakeConnection mc;
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@192.168.0.206:1521:orcl";
	private String user ="scott";
	private String password = "tiger";
	private Connection conn;
	
	private MakeConnection() {
		
	}
	
	public static MakeConnection getInstance() {
		if(mc == null) {
			mc = new MakeConnection();
		}
		return mc;
	}
	
	public Connection getConnection() {
		try {
// 2. 드라이버 로딩
			Class.forName(driver);
// 3. Connection 객체 생성
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("conn: " + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버로딩실패");
		} catch (SQLException e) {
			System.out.println("db연결 실패");
		}
		return conn;
	}
}
