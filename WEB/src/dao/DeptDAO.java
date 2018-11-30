package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.DeptVO;

// Database Access Object
public class DeptDAO {
	// 0. 변수선언
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@192.168.0.206:1521:orcl";
	String user = "scott";
	String password = "tiger";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	StringBuffer sb = new StringBuffer();

	public DeptDAO() {
		// 생성자
		// 1. JDC driver 로딩
		// 2. Connection 객체 생성
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이브 로딩실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		} // try~catch end
	} // constructer end

	// CRUD
	// 1) 테이블 전체조회
	public ArrayList<DeptVO> selectAll() {
		ArrayList<DeptVO> list = new ArrayList<DeptVO>();
		// SQL문을 초기화
		sb.setLength(0); // 문장 길이를 0으로

		// 3. SQL문을 작성
		sb.append("SELECT* FROM dept");

		try {
			// 4. 문장객체를 생성
			pstmt = conn.prepareStatement(sb.toString());
			// 5. 문장 실행 (ResultSet 객체)
			rs = pstmt.executeQuery();

			// 6. 레코드별 로직 처리
			while (rs.next()) {
				int deptno = rs.getInt("deptno");
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");

				// VO
				DeptVO vo = new DeptVO();
				vo.setDeptno(deptno);
				vo.setDname(dname);
				vo.setLoc(loc);

				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally { // 7. 자원반납
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}

	// 2) 특정 데이터 1건 조회
	public DeptVO selectOne(int no) {
		// SQL문을 초기화
		sb.setLength(0); // 문장 길이를 0으로

		// 3. SQL문을 작성
		sb.append("SELECT * FROM DEPT ");
		sb.append("WHERE deptno = ?");

		System.out.println("SQL문 출력: " + sb.toString());

		DeptVO vo = new DeptVO();
		try {
			// 4. 문장객체를 생성
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);

			// 5. 문장실행
			rs = pstmt.executeQuery();

			// 6. ResultSet 객체로 리턴 (select문만)
			rs.next();
			int deptno = rs.getInt("deptno");
			String dname = rs.getString("dname");
			String loc = rs.getString("loc");
			vo.setDeptno(deptno);
			vo.setDname(dname);
			vo.setLoc(loc);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally { // 7. 자원반납
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return vo;
	}

	// 3) 추가
	public void insertOne(DeptVO vo) {
		// SQL문을 초기화
		sb.setLength(0); // 문장 길이를 0으로

		// 3. SQL문을 작성
		sb.append("INSERT INTO DEPT ");
		sb.append("VALUES ( DEPT_DEPTNO.NEXTVAL, ?, ? ) ");

		try {
			// 4. 문장객체를 생성
			pstmt = conn.prepareStatement(sb.toString());

			// 5. 문장실행
			pstmt.setString(1, vo.getDname());
			pstmt.setString(2, vo.getLoc());

			int result = pstmt.executeUpdate();
			System.out.println("result: " + result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally { // 7. 자원반납
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// 4) 변경
	public void updateOne(DeptVO vo) {
		// SQL문을 초기화
		sb.setLength(0); // 문장 길이를 0으로

		// 3. SQL문을 작성
		sb.append("UPDATE dept ");
		sb.append("SET dname = ?, loc = ? ");
		sb.append("WHERE deptno = ? ");
		
		try {
			// 4. 문장객체를 생성
			pstmt = conn.prepareStatement(sb.toString());
			// 5. 문장실행
			pstmt.setString(1, vo.getDname());
			pstmt.setString(2, vo.getLoc());
			pstmt.setInt(3, vo.getDeptno());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally { // 7. 자원반납
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		

	}

	// 5) 삭제
	public void deleteOne(int no) {
		// SQL문을 초기화
		sb.setLength(0); // 문장 길이를 0으로

		// 3. SQL문을 작성
		sb.append("DELETE DEPT ");
		sb.append("WHERE deptno = ? ");

		try {
			// 4. 문장객체를 생성
			pstmt = conn.prepareStatement(sb.toString());
			// 5. 문장실행
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally { // 7. 자원반납
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void close() {
		// 접속종료
		try {
			if (rs != null)	rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
} // class end
