package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import VO.FmemberVO;

public class FmemberDAO {
	// 1. 변수설정
	private Connection conn;
	PreparedStatement pstmt;
	StringBuffer sb = new StringBuffer();
	ResultSet rs;

	public FmemberDAO() {
		conn = FmakeConnection.getInstance().getConnection();
	}
	
	// CRUD

	public boolean isExist(String id, String pw) {
		sb.setLength(0);
		sb.append("SELECT id FROM member ");
		sb.append("WHERE id = ? and pw = ? ");
		boolean isOk = false;

		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			rs = pstmt.executeQuery();
			isOk = rs.next();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isOk;
	}
	
	public boolean isExist(String id) {
		sb.setLength(0);
		sb.append("SELECT id FROM member ");
		sb.append("WHERE id = ? ");
		boolean isOk = false;

		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setString(1, id);
			// pstmt.setString(2, pw);

			rs = pstmt.executeQuery();
			isOk = rs.next();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isOk;
	}

	public void addMember(FmemberVO vo) {
		// 4. SQL문 작성
		sb.setLength(0); // 혹시 전에 사용한 적이 있다면 초기화
		sb.append("INSERT INTO member ");
		sb.append("VALUES (?, ? , ?, ?, ?, ?, ?, ?, ?, ? ) ");

		// 5. 문장 객체 생성
		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getNname());
			pstmt.setString(5, vo.getAddr1());
			pstmt.setString(6, vo.getAddr2());
			pstmt.setString(7, vo.getAddr3());
			pstmt.setString(8, vo.getPnum1());
			pstmt.setString(9, vo.getPnum2());
			pstmt.setString(10, vo.getPnum3());

			// 6. 실행 (SELECT ==> ResultSet)
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public FmemberVO selectOne(String id) {
	      FmemberVO vo = new FmemberVO();
	      
	      sb.setLength(0);
	      sb.append("select id, pw, name, nname, addr1, addr2, addr3, ");
	      sb.append("pnum1, pnum2, pnum3 from member ");
	      sb.append("where id = ? ");
	      
	      try {
	         pstmt = conn.prepareStatement(sb.toString());
	         pstmt.setString(1, id);
	         
	         rs = pstmt.executeQuery();
	         rs.next();
	         
	         String pid = rs.getString("id");
	         String pw = rs.getString("pw");
	         String name = rs.getString("name");
	         String nname = rs.getString("nname");
	         String addr1 = rs.getString("addr1");
	         String addr2 = rs.getString("addr2");
	         String addr3 = rs.getString("addr3");
	         String pnum1 = rs.getString("pnum1");
	         String pnum2 = rs.getString("pnum2");
	         String pnum3 = rs.getString("pnum3");
	         
	         vo.setId(pid);
	         vo.setPw(pw);
	         vo.setName(name);
	         vo.setNname(nname);
	         vo.setAddr1(addr1);
	         vo.setAddr2(addr2);
	         vo.setAddr3(addr3);
	         vo.setPnum1(pnum1);
	         vo.setPnum2(pnum2);
	         vo.setPnum3(pnum3);
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	         try {
	            if(rs != null) rs.close();
	            if(pstmt != null) pstmt.close();
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	      }
	      return vo;
	   }

	public void close() {
		try {
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
			if (conn != null)
				conn.close(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}