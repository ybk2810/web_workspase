package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.acorn.web.vo.DeptVO;

public class DeptDAO {
	public SqlSession ss;
	
	public DeptDAO() {
		Reader r = null;
		try {
			// 설정 파일 읽기
			r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
			// 인부 객체 생성
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			// 팩토리 생성
			SqlSessionFactory factory = builder.build(r);
			r.close();
			// SqlSession 객체 
			ss = factory.openSession(true);// true는 autocommit
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(r!=null) {
				try {
					r.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	public List<DeptVO> selectAll(){
		return ss.selectList("kr.co.acorn.dept.selectAll");
	}
	
	// 1건 추가 insertOne()
	public void insertOne(DeptVO vo){
		ss.insert("kr.co.acorn.dept.addOne", vo);
	}
	
	// 부서 조회 selectDept(String dname)
	public DeptVO selectDept(String dname){
		Object obj = ss.selectOne("kr.co.acorn.dept.selectByName", dname);
		return (DeptVO)obj;
	}
	
	// 부서번호로 조회 selectOne(int no)
	public DeptVO selectOne(int no){
		Object obj = ss.selectOne("kr.co.acorn.dept.selectByNo", no);
		return (DeptVO)obj;
	}
	
	//부서번호로 삭제
	public void drop(int no) {
		ss.delete("kr.co.acorn.dept.deptDrop", no);
	}
	
}// DeptDAO class end
