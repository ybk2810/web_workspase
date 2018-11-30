package dao;

import java.util.ArrayList;

import vo.ProductVO;

public class TestMain2 {
	public static void main(String[] args) {
		ProductDAO dao = new ProductDAO();
		
		ArrayList<ProductVO> list = dao.getAllData();
		
		System.out.println(list);
	}
}
