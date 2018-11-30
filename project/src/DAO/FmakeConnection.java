package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class FmakeConnection {

	private static FmakeConnection mc;
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@orcl.crrzoburhc6p.ap-northeast-2.rds.amazonaws.com:1521:orcl";
										// @ 안쓰면 로컬로 인식
	private String user = "scott";
	private String password = "wannaone";
	private Connection conn;

	private FmakeConnection() {

	}

	public static FmakeConnection getInstance() {
		if (mc == null) {
			mc = new FmakeConnection();
		}
		return mc;
	}

	public Connection getConnection() {

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);

			System.out.println("conn : " + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("db연결 실패");
			e.printStackTrace();
		}

		return conn;
	}
}