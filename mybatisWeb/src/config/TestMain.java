package config;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dao.DeptDAO;
import kr.co.acorn.web.vo.DeptVO;

public class TestMain {
	public static void main(String[] args) throws IOException {
		DeptDAO dao = new DeptDAO();
		System.out.println(dao.ss);
		
		List<DeptVO> list = dao.selectAll();
		
		for(DeptVO vo : list) {
			System.out.println(vo.getDname());
		}
	}
}
