package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BoardVO;

public class BoardDAO {
	private Connection conn;
	PreparedStatement pstmt;
	StringBuffer sb = new StringBuffer();
	ResultSet rs;
	
	//생성자
	public BoardDAO(){
		conn = MakeConnection.getInstance().getConnection();
	}
	
	public int getTotal() {
		//게시물 총 건수를 리턴하는 메서드
		sb.setLength(0);
		sb.append("select count(*) cnt from board ");
		int cnt = 0;
		try {
			pstmt=conn.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("cnt");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	//CRUD
	public ArrayList<BoardVO> selectAll(int start, int end){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		sb.setLength(0);
		sb.append("select rn, BNO, WRITER, TITLE, CONTENTS, HITS, REGDATE, STATUS "); 
		sb.append("from (SELECT ROWNUM rn, BNO, WRITER, TITLE, CONTENTS, HITS, REGDATE, STATUS ");
		sb.append("FROM (SELECT BNO, WRITER, TITLE, CONTENTS, HITS, to_char(REGDATE,'yyyy/mm/dd') regdate, STATUS ");
		sb.append("FROM BOARD ");
		sb.append("ORDER BY BNO DESC) ");
		sb.append("WHERE ROWNUM <=?) ");
		sb.append("where rn>=? ");
		
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bno = rs.getInt("bno");
				int hits = rs.getInt("hits");
				int status = rs.getInt("status");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String regdate = rs.getString("regdate");
				
				BoardVO vo = new BoardVO(bno, writer, title, contents, hits, regdate, status);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}
	
	public BoardVO selectOne(int no) {
		BoardVO vo = new BoardVO();
		
		sb.setLength(0);
		sb.append("select bno, hits, status, writer, title, contents, to_char(regdate,'yyyy/mm/dd') regdate from board ");
		sb.append("where bno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			int bno = rs.getInt("bno");
			int hits = rs.getInt("hits");
			int status = rs.getInt("status");
			String writer = rs.getString("writer");
			String title = rs.getString("title");
			String contents = rs.getString("contents");
			String regdate = rs.getString("regdate");
			
			vo.setBno(bno);
			vo.setHits(hits);
			vo.setStatus(status);
			vo.setWriter(writer);
			vo.setTitle(title);
			vo.setContents(contents);
			vo.setRegdate(regdate);
			
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
	
	public void add(BoardVO vo) {
		sb.setLength(0);
		sb.append("insert into board ");
		sb.append("values(board_bno_seq.nextval, ?, ?, ?, 0, sysdate, 1 ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContents());
	
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void modify(BoardVO vo) {
		sb.setLength(0);
		sb.append("update board ");
		sb.append("set title = ?, contents = ?, regdate = sysdate ");
		sb.append("where bno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContents());
			pstmt.setInt(3, vo.getBno());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void drop(int no) {
		sb.setLength(0);
		sb.append("delete from board ");
		sb.append("where bno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if (rs != null) rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void raiseHits(int no) {
		sb.setLength(0);
		sb.append("update board ");
		sb.append("set hits = hits + 1 ");
		sb.append("where bno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		
			try {
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
				if(conn!=null)conn.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}

