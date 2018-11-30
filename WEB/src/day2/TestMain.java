package day2;

import dao.MakeConnection;
import dao.MemberDAO;
import dao.ProductDAO;
import vo.MemberVO;
import vo.ProductVO;

public class TestMain {
	public static void main(String[] args) {
//		MemberDAO dao = new MemberDAO();
//		System.out.println(dao.isExist("KS", "tiger"));
//		
//		MemberVO vo = new MemberVO();
//		vo.setId("태종띠");
//		vo.setPw("앙기모띠");
//		vo.setName("누구게");
//		
//		dao.addMember(vo);
//		
//		productDAO dao2 = new productDAO();
//		System.out.println(dao2);
//		
		
		
		
		
		
		// db 연결: 자원 많이 사용
		// MakeConnection 자원을 많이 소모하는 객체
		ProductDAO dao = new ProductDAO();
		
		// 현재 실행중에는 1개의 객체만 사용 하도록?
		/*MakeConnection mc1 = MakeConnection.getInstance();
		MakeConnection mc2 = MakeConnection.getInstance();
		MakeConnection mc3 = MakeConnection.getInstance();
		
		System.out.println("mc1: " + mc1);
		System.out.println("mc2: " + mc2);
		System.out.println("mc3: " + mc3);*/
		
		
		
		// 1. 이름 
//		ProductVO vo = dao.getByName("gripss");
//		System.out.println(vo.getPname());
//		System.out.println(vo.getPno());
		
		// 2. 번호
		ProductVO vo = dao.getByNo(114);
		System.out.println(vo.getPname());
		System.out.println(vo.getPno());
		
		
		
		
		
	}
}
