package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ProductVO;

public class ProductDAO {
//1. 변수설정
	Connection conn;
	PreparedStatement pstmt;
	StringBuffer sb = new StringBuffer();
	ResultSet rs;
		
	public ProductDAO(){
		conn = MakeConnection.getInstance().getConnection();
	} // constructor end	
	// CRUD
	
	// 전체조회
	public ArrayList<ProductVO> getAllData(){
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		
		sb.setLength(0);
		sb.append("SELECT * FROM product");

		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int pno = rs.getInt("pno");
				String pname = rs.getString("pname");
				String prodesc = rs.getString("prodesc");
				int price = rs.getInt("price");
				int dcratio = rs.getInt("dcratio");
				int qty = rs.getInt("qty");
				String imgfile = rs.getString("imgFile");
				String bigfile = rs.getString("bigFile");
				
				ProductVO vo  = new ProductVO(pno, pname, prodesc, price, dcratio, qty, imgfile, bigfile);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	// 1건 조회
	// 상품명으로 조회
	
	public ProductVO getByName(String name) {
		ProductVO vo = new ProductVO();
		
		sb.setLength(0);
		sb.append("SELECT * FROM product ");
		sb.append("WHERE pname like '%' || ? || '%'");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			rs.next();
			
			int pno = rs.getInt("pno");
			String pname = rs.getString("pname");
			String prodesc = rs.getString("prodesc");
			int price = rs.getInt("price");
			int dcratio = rs.getInt("dcratio");
			int qty = rs.getInt("qty");
			String imgfile = rs.getString("imgFile");
			String bigfile = rs.getString("bigFile");
			
			
			vo.setBigfile(bigfile);
			vo.setDcratio(dcratio);
			vo.setImgfile(imgfile);
			vo.setPname(pname);
			vo.setPno(pno);
			vo.setPrice(price);
			vo.setProdesc(prodesc);
			vo.setQty(qty);
			
			
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
	
	public ProductVO getByNo(int no) {
		ProductVO vo = new ProductVO();
		
		sb.setLength(0);
		sb.append("SELECT * FROM product ");
		sb.append("WHERE pno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			rs.next();
			
			int pno = rs.getInt("pno");
			String pname = rs.getString("pname");
			String prodesc = rs.getString("prodesc");
			int price = rs.getInt("price");
			int dcratio = rs.getInt("dcratio");
			int qty = rs.getInt("qty");
			String imgfile = rs.getString("imgFile");
			String bigfile = rs.getString("bigFile");
			
			
			vo.setBigfile(bigfile);
			vo.setDcratio(dcratio);
			vo.setImgfile(imgfile);
			vo.setPname(pname);
			vo.setPno(pno);
			vo.setPrice(price);
			vo.setProdesc(prodesc);
			vo.setQty(qty);
			
			
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
	
	// 1건 추가
	public void addItem(ProductVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO product ");
		sb.append("VALUES(PRODUCT_PNO_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ? )");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getPname());
			pstmt.setString(2, vo.getProdesc());
			pstmt.setInt(3, vo.getPrice());
			pstmt.setInt(4, vo.getDcratio());
			pstmt.setInt(5, vo.getQty());
			pstmt.setString(6, vo.getImgfile());
			pstmt.setString(7, vo.getBigfile());
			
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
