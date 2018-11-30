package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import VO.MaterialVO;

public class MaterialDAO {

   private Connection conn;
   PreparedStatement pstmt;
   StringBuffer sb = new StringBuffer();
   ResultSet rs;

   // 기본생성자
   public MaterialDAO() {
      conn = FmakeConnection.getInstance().getConnection();
   }

   // 재료 전체조회

   public ArrayList<MaterialVO> getAllData(String fmno) {
      ArrayList<MaterialVO> list = new ArrayList<MaterialVO>();

      sb.setLength(0);
      sb.append("select * from material ");

      try {
         pstmt = conn.prepareStatement(sb.toString());
         rs = pstmt.executeQuery();

         while (rs.next()) {
            int mno = rs.getInt("mno");
            String mname = rs.getString("mname");
            int price = rs.getInt("price");
            int amount = rs.getInt("amount");
            String scale = rs.getString("scale");
            String image = rs.getString("image");

            MaterialVO vo = new MaterialVO(mno, mname, price, scale, amount, image);

            list.add(vo);

         }
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
      return list;
   }
   
   //재료 번호로 1건 조회
   public MaterialVO getByNum(int fmno) {

      sb.setLength(0);
      sb.append("select * from material ");
      sb.append("where mno = ? ");

      MaterialVO vo = new MaterialVO();

      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setInt(1, fmno);

         rs = pstmt.executeQuery();
         rs.next();

         int mno = rs.getInt("mno");
         String mname = rs.getString("mname");
         String scale = rs.getString("scale");
         int price = rs.getInt("price");
         int amount = rs.getInt("amount");
         String image = rs.getString("image");

         vo.setMno(mno);
         vo.setMname(mname);
         vo.setScale(scale);
         vo.setPrice(price);
         vo.setAmount(amount);
         vo.setImage(image);

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
   

public void addItem(MaterialVO vo) {
      
      sb.setLength(0);
      sb.append("insert into product ");
      sb.append("values (product_mno_seq.nextval,?,?,?,?,?)");
      
      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setString(1, vo.getMname());
         pstmt.setInt(2, vo.getPrice());
         pstmt.setString(3, vo.getScale());
         pstmt.setInt(4, vo.getAmount());
         pstmt.setString(5, vo.getImage());
;
         
         pstmt.executeUpdate();
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         try {
         if(pstmt!=null)pstmt.close();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
      }
      
      
   }
}