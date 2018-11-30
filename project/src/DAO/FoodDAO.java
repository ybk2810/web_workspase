package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.FoodVO;

public class FoodDAO {

	private Connection conn;
	PreparedStatement pstmt;
	StringBuffer sb = new StringBuffer();
	ResultSet rs;

	// 생성자

	public FoodDAO() {
		conn = FmakeConnection.getInstance().getConnection();
	}

	// 음식 전체 조회
	public ArrayList<FoodVO> getAllData() {
		ArrayList<FoodVO> list = new ArrayList<FoodVO>();

		sb.setLength(0);
		sb.append("select * from food ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int fno = rs.getInt("fno");
				String mfno = rs.getString("mfno");
				String fname = rs.getString("fname");
				String fimage = rs.getString("fimage");
				String kind = rs.getString("kind");
				int pnum = rs.getInt("pnum");
				int ctime = rs.getInt("ctime");
				String recipeimg = rs.getString("recipeimg");

				FoodVO vo = new FoodVO(fno, mfno, fname, fimage, kind, pnum, ctime, recipeimg);

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

	// 1건조회, 음식이름으로 조회
	public FoodVO getByName(String name) {
		sb.setLength(0);
		sb.append("select * from food ");
		sb.append("where fname like '%' || ? || '%' ");

		FoodVO vo = new FoodVO();

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, name);

			rs = pstmt.executeQuery();
			rs.next();

			int fno = rs.getInt("fno");
			String mfno = rs.getString("mfno");
			String fname = rs.getString("fname");
			String fimage = rs.getString("fimage");
			String kind = rs.getString("kind");
			int pnum = rs.getInt("pnum");
			int ctime = rs.getInt("ctime");
			String recipeimg = rs.getString("recipeimg");

			vo.setFno(fno);
			vo.setMfno(mfno);
			vo.setFname(fname);
			vo.setFimage(fimage);
			vo.setKind(kind);
			vo.setPnum(pnum);
			vo.setCtime(ctime);
			vo.setRecipeimg(recipeimg);
			
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

	public FoodVO getByNum(int no) {
		FoodVO vo = new FoodVO();

		sb.setLength(0);
		sb.append("select * from food ");
		sb.append("where fno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();
			rs.next();

			int fno = rs.getInt("fno");
			String mfno = rs.getString("mfno");
			String fname = rs.getString("fname");
			String fimage = rs.getString("fimage");
			String kind = rs.getString("kind");
			int pnum = rs.getInt("pnum");
			int ctime = rs.getInt("ctime");
			String recipeimg = rs.getString("recipeimg");

			vo.setFno(fno);
			vo.setMfno(mfno);
			vo.setFname(fname);
			vo.setFimage(fimage);
			vo.setKind(kind);
			vo.setPnum(pnum);
			vo.setCtime(ctime);
			vo.setRecipeimg(recipeimg);

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
	
	public ArrayList<Integer> getByKind(String k) {
		ArrayList<Integer> list = new ArrayList<Integer>();

		sb.setLength(0);
		sb.append("select fno from food ");
		sb.append("where kind = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, k);

			rs = pstmt.executeQuery();
	        while(rs.next()) {
	        	int fno = rs.getInt("fno");
	        	 
	        	list.add(fno);
	        }

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
		return list;

	}
	
	//1건 랜덤조회
	   public ArrayList<Integer> getByRandom() {
	      sb.setLength(0);
	      sb.append("select fno from ( ");
	      sb.append("select * from food ");
//	      sb.append("where fno = ? ");
	      sb.append("order by dbms_random. value) ");
	      sb.append("where rownum<=4 ");

	      FoodVO vo = new FoodVO();
	      ArrayList<Integer> list = new ArrayList<Integer>();

	      try {
	         pstmt = conn.prepareStatement(sb.toString());
//	         pstmt.setInt(1, no);

	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	        	 int fno = rs.getInt("fno");
	        	 
	        	 list.add(fno);
	         }
	         
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
	      return list;

	   }
	
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