package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.FboardVO;

public class FboardDAO {
	private Connection conn;
	PreparedStatement pstmt;
	StringBuffer sb = new StringBuffer();
	ResultSet rs;

	// 생성자
	public FboardDAO() {
		conn = FmakeConnection.getInstance().getConnection();
	}

	public int getTotal() {
		// 게시물의 총건수를 리턴하는 메소드

		sb.setLength(0);
		sb.append("SELECT count(*) cnt from borad ");

		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;

	}

	// CRUD
	public ArrayList<FboardVO> selectAll(int start, int end) {
		ArrayList<FboardVO> list = new ArrayList<FboardVO>();

		sb.setLength(0);
		/*
		 * sb.
		 * append("select bno, writer, title, contents, hits, to_char(regdate, 'yyyy/mm/dd') regdate, status from board "
		 * ); sb.append("order by bno desc");
		 */

		sb.append("select rn, bno, writer, title, contents, hits, regdate, status ");
		sb.append("from (select rownum rn, bno, writer ");
		sb.append("     from(select bno, writer, title, contents, hits,to_char(regdate, 'yyyy/mm/dd') regdate, status ");
		sb.append("             from board ");
		sb.append("                order by regdate desc) ");
		sb.append("                 where rownum <=? ");
		sb.append(" where rn >= ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, end);
			pstmt.setInt(1, start);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int bno = rs.getInt("bno");
				int hits = rs.getInt("hits");
				int status = rs.getInt("status");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String regdate = rs.getString("regdate");

				FboardVO vo = new FboardVO(bno, writer, title, contents, hits, regdate, status);

				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

		return list;
	}

	public void raiseHits(int no) {
		sb.setLength(0);
		sb.append("update board ");
		sb.append("set hits = hits+1 ");
		sb.append("where bno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			pstmt.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public FboardVO selectOne(int no) {
		FboardVO vo = new FboardVO();

		sb.setLength(0);
		sb.append("select * from board ");
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
		} finally {
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

	public void add(FboardVO vo) {
		sb.setLength(0);
		sb.append("insert into board ");
		sb.append("values(board_bno_seq_nextval, ?, ?, ?, 0, sysdate, 1 ) ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContents());
			/*
			 * pstmt.setInt(4, vo.getHits()); pstmt.setString(5, vo.getRegdate());
			 * pstmt.setInt(6, vo.getStatus());
			 */

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void modify(FboardVO vo) {
		sb.setLength(0);
		sb.append("update board ");
		sb.append("set title = ?, contents = ?, regdate = sysdate ");
		sb.append("where bno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContents());
			pstmt.setInt(4, vo.getHits());
			pstmt.setString(5, vo.getRegdate());
			pstmt.setInt(6, vo.getStatus());
			pstmt.setInt(7, vo.getBno());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
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
	}

	public void close() {
		try {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}