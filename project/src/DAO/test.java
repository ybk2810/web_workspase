package DAO;

import java.util.ArrayList;

import VO.FmemberVO;
import VO.FoodVO;
import VO.ReviewVO;

public class test {
	public static void main(String[] args) {
		FmemberDAO dao = new FmemberDAO();
		System.out.println(dao.isExist("test"));
		
		FoodDAO dao1 = new FoodDAO();
		ArrayList<FoodVO> list = dao1.getAllData();
		ArrayList<Integer> list2 = dao1.getByKind("일반식");
		
		System.out.println(list);
		System.out.println(list2);
		
		FoodVO vo = dao1.getByName("과일");
		System.out.println(vo.getFname());
		
		FmemberDAO memberdao = new FmemberDAO();
		FmemberVO fvo = memberdao.selectOne("lili");
		System.out.println(fvo.getName());
		
		ArrayList<Integer> li = dao1.getByRandom();
		System.out.println(li);
		
		ReviewDAO rdao = new ReviewDAO();
		ArrayList<ReviewVO> lis = rdao.selectAll(3);
		System.out.println(lis);
	}
}
