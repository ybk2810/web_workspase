package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.MemberVO;


public class MemberDAO {
//1. 변수설정
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@192.168.0.206:1521:orcl";
	String user ="scott";
	String password = "tiger";
	Connection conn;
	PreparedStatement pstmt;
	StringBuffer sb = new StringBuffer();
	ResultSet rs;
	
	public MemberDAO(){
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
		
		
	} // constructor end
	
	// CRUD
	public boolean isExist(String id, String pw) {
		sb.setLength(0);
		sb.append("SELECT id FROM member ");
		sb.append("WHERE id = ? and pw = ? ");
		boolean isOK = false; // 값이 있다면
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			isOK = rs.next();
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
				try {
					if(pstmt!=null)pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return isOK;
	}
	
	public boolean isExist(String id) {
		sb.setLength(0);
		sb.append("SELECT id FROM member ");
		sb.append("WHERE id = ? ");
		boolean isOK = false; // 값이 있다면
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			isOK = rs.next();
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
				try {
					if(pstmt!=null)pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return isOK;
	}
	
	public void addMember(MemberVO vo) {
		// 4. SQL문 작성
		sb.setLength(0);//혹시 전에 사용한 적이 있다면 초기화
		sb.append("INSERT INTO member ");
		sb.append("VALUES (?,?,?,0,sysdate)");
		
		// 5. 문장 객체 생성
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			// 6. 실행
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
				try {
					if(pstmt!=null)pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		// 7. 레코드별 로직 처리
		
	}
	
	// 8. 자원 반납
	public void close() {
		try {
			if(pstmt!=null)conn.close();
			if(conn!=null)conn.close();
			if(rs!=null)conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
