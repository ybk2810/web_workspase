package main;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import vo.EmpVO;

public class TestMain {
	public static void main(String[] args) throws IOException {
		// List<EmpVO> list = ss.selectList("empSelectAll");
		Reader r = Resources.getResourceAsReader("config/SqlMapconfig.xml");
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		SqlSessionFactory factory = builder.build(r);
		r.close();
		SqlSession ss = factory.openSession(true);
		System.out.println("ss: " + ss);
		// 전체 조회
		// ss.selectList("sql문의 별칭");
		/*List<EmpVO> list = ss.selectList("empAll");
		
		for(EmpVO vo : list) {
			System.out.println("----------");
			System.out.println("사원번호: " + vo.getEmpno());
			System.out.println("사원명: " + vo.getEname());
			System.out.println("직업: " + vo.getJob());
			System.out.println("상사번호: " + vo.getMgr());
			System.out.println("입사일: " + vo.getHiredate());
			System.out.println("급여: " + vo.getSal());
			System.out.println("수수료: " + vo.getComm());			
			System.out.println("부서번호: " + vo.getDeptno());
		}*/
		
		// 1건 조회
		Object obj1 = ss.selectOne("empOne", 7839);
		
		System.out.println("----------");
		EmpVO vo1 = (EmpVO)obj1;
		System.out.println("사원번호: " + vo1.getEmpno());
		System.out.println("사원명: " + vo1.getEname());
		System.out.println("직업: " + vo1.getJob());
		System.out.println("상사번호: " + vo1.getMgr());
		System.out.println("입사일: " + vo1.getHiredate());
		System.out.println("급여: " + vo1.getSal());
		System.out.println("수수료: " + vo1.getComm());			
		System.out.println("부서번호: " + vo1.getDeptno());
		
		Object obj2 = ss.selectOne("empOneByName", "SCOTT");
		System.out.println("----------");
		EmpVO vo2 = (EmpVO)obj2;
		System.out.println("사원번호: " + vo2.getEmpno());
		System.out.println("사원명: " + vo2.getEname());
		System.out.println("직업: " + vo2.getJob());
		System.out.println("상사번호: " + vo2.getMgr());
		System.out.println("입사일: " + vo2.getHiredate());
		System.out.println("급여: " + vo2.getSal());
		System.out.println("수수료: " + vo2.getComm());			
		System.out.println("부서번호: " + vo2.getDeptno());
		
		// 삽입 ename, job, mgr, hiredate, sal, comm, deptno
		/*EmpVO vo4 = new EmpVO();
		vo4.setEname("SANGJUN");
		vo4.setJob("PRESIDENT");
		vo4.setMgr(7839);
		vo4.setHiredate("2017/04/12");
		vo4.setSal(1000);
		vo4.setComm(1000);
		vo4.setDeptno(10);
		ss.insert("empInsertOne", vo4);
		System.out.println("----------");*/
		
		// 수정
		/*EmpVO vo4 = new EmpVO();
		vo4.setEname("상준");
		vo4.setJob("자지마");
		vo4.setMgr(7839);
		vo4.setHiredate("2017/04/12");
		vo4.setSal(1);
		vo4.setComm(0);
		vo4.setDeptno(10);
		vo4.setEmpno(15);
		ss.update("empUpdateOne", vo4);*/
		
		// 삭제
		ss.delete("empDeleteOne", 20);
		
		List<EmpVO> list1 = ss.selectList("empAll");
		for(EmpVO vo5 : list1) {
			System.out.println("----------");
			System.out.println("사원번호: " + vo5.getEmpno());
			System.out.println("사원명: " + vo5.getEname());
			System.out.println("직업: " + vo5.getJob());
			System.out.println("상사번호: " + vo5.getMgr());
			System.out.println("입사일: " + vo5.getHiredate());
			System.out.println("급여: " + vo5.getSal());
			System.out.println("수수료: " + vo5.getComm());			
			System.out.println("부서번호: " + vo5.getDeptno());
		}
	}
}
