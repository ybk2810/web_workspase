package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.ImageVO;
import vo.ProductVO;

public class ImageDAO {
	Connection conn;
	PreparedStatement pstmt;
	StringBuffer sb = new StringBuffer();
	ResultSet rs;
	
	public ImageDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}

	public ImageVO getFileName(String name) {
		sb.setLength(0);
		sb.append("SELECT no, namen filepath FROM imagestore");
		sb.append("WHERE name like '%' || ? || '%'");
		ImageVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, name);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String filePath = rs.getString("filePath");
				
				vo.setNo(no);
				vo.setName(name);
				vo.setFilePath(filePath);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)pstmt.close();
			}catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return vo;
	}
	
	public void insertData(ImageVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO imagestore ");
		sb.append("VALUES(IMAGESTORE_NO_SEQ.NEXTVAL, ?, ? )");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getFilePath());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)pstmt.close();
			}catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
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
}
