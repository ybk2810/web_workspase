package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.ReviewVO;

public class ReviewDAO {

   private Connection conn;
   PreparedStatement pstmt;
   StringBuffer sb = new StringBuffer();
   ResultSet rs;

   // 생성자
   public ReviewDAO() {
      conn = FmakeConnection.getInstance().getConnection();
   }

   public int getTotal() {
      // 리뷰의 총건수를 리턴하는 메소드

      sb.setLength(0);
      sb.append("SELECT count(*) cnt from review");

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

   public ArrayList<ReviewVO> selectAll(int no) {
      ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();

      sb.setLength(0);

      sb.append("select rno, fno, rwriter, rcontents, star, regdate from review ");
      sb.append("where fno = ? ");

      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setInt(1, no);
         rs = pstmt.executeQuery();

         while (rs.next()) {
            int rno = rs.getInt("rno");
            int fno = rs.getInt("fno");
            String rwriter = rs.getString("rwriter");
            String rcontents = rs.getString("rcontents");
            String star = rs.getString("star");
            String regdate = rs.getString("regdate");

            ReviewVO vo = new ReviewVO(rno, fno, rwriter, rcontents, star, regdate);

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
      sb.append("update review ");
      sb.append("set hits = hits+1");
      sb.append("where rno = ? ");

      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setInt(1, no);
         pstmt.executeQuery();

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }

   public ReviewVO selectOne(int no) {
      ReviewVO vo = new ReviewVO();

      sb.setLength(0);
      sb.append("select * from review ");
      sb.append("where rno = ? ");

      try {

         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setInt(1, no);

         rs = pstmt.executeQuery();
         rs.next();

         int rno = rs.getInt("rno");
         int fno = rs.getInt("fno");
         String rwriter = rs.getString("rwriter");
         String rcontents = rs.getString("rcontents");
         String star = rs.getString("star");
         String regdate = rs.getString("regdate");

         vo.setRno(rno);
         vo.setFno(fno);
         vo.setRwriter(rwriter);
         vo.setRcontents(rcontents);
         vo.setStar(star);
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

   public void add(ReviewVO vo, int no, String id) {
		sb.setLength(0);
		sb.append("insert into review ");
		sb.append("values(review_rno_seq.nextval, ?, ?, ?, 1, sysdate ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			pstmt.setString(2, id);
			pstmt.setString(3, vo.getRcontents());	
			
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

   public void modify(ReviewVO vo) {
      sb.setLength(0);
      sb.append("update review");
      sb.append("set rno=?, rcontents = ?, regdate = sysdate");
      sb.append("where fno= ?");
      
      try {
            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setInt(1, vo.getRno());
            pstmt.setInt(2,  vo.getFno());
            pstmt.setString(3,  vo.getRwriter());
            pstmt.setString(4, vo.getRcontents());
            pstmt.setString(5,  vo.getStar());
            pstmt.setString(6,  vo.getRegdate());
     
            
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
      sb.append("delete from review ");
      sb.append("where rno = ? ");

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