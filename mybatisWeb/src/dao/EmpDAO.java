package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.acorn.web.vo.DeptVO;
import kr.co.acorn.web.vo.EmpVO;
import service.FactoryService;

public class EmpDAO {
	SqlSessionFactory factory;
	
	public EmpDAO() {
		factory = FactoryService.getFactory();
		System.out.println("EmpDAO Factory: " + factory);
		
	}
	
	public List<EmpVO> selectAll(){
		SqlSession ss = factory.openSession(true);
		List<EmpVO> list = ss.selectList("kr.co.acorn.emp.selectAll");
		ss.close();
		
		return list;
	}
}
