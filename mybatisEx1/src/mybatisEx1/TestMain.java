package mybatisEx1;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import vo.DeptVO;

public class TestMain {
	public static void main(String[] args) throws IOException {
		// 1. mybatis의 설정 파일을 읽기
		
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		// 2. 접근
		// jdbc 연결 객체: Connection conn
		// Mybatis 연결 객체: SqlSession
		
		// SqlSession ==> 자동차
		
		// SqlSessionFactory ==> 자동차 공장
		
		// SqlSessionFactoryBuilder ==> 인부
		
		// 인부 생성
		
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		
		// 설계도로 공장 건설
		SqlSessionFactory factory = builder.build(r);
		
		// 도면 정리
		r.close();
		
		// 공장에서 자동차 생성
		SqlSession ss = factory.openSession(true);
		
		System.out.println("ss: " + ss);
		
		// 전체 조회
		// ss.selectList("sql문의 별칭");
		List<DeptVO> list = ss.selectList("deptAll");
		
		for(DeptVO vo : list) {
			System.out.println("----------");
			System.out.println("부서번호: " + vo.getDeptno());
			System.out.println("부서명: " + vo.getDname());
			System.out.println("부서위치: " + vo.getLoc());
		}
		
		// 1건 조회
		Object obj1 = ss.selectOne("deptOne", 10);
		
		System.out.println("----------");
		System.out.println("obj: " + obj1);
		DeptVO vo1 = (DeptVO)obj1;
		System.out.println("부서번호: " + vo1.getDeptno());
		System.out.println("부서명: " + vo1.getDname());
		System.out.println("부서위치: " + vo1.getLoc());
		
		Object obj2 = ss.selectOne("deptOneByName", "SALES");
		System.out.println("----------");
		System.out.println("obj: " + obj2);
		DeptVO vo2 = (DeptVO)obj2;
		System.out.println("부서번호: " + vo2.getDeptno());
		System.out.println("부서명: " + vo2.getDname());
		System.out.println("부서위치: " + vo2.getLoc());
		
		Object obj3 = ss.selectOne("deptOne", 30);
		System.out.println("----------");
		DeptVO vo3 = (DeptVO)obj3;
		System.out.println("30번 부서의 부서위치: " + vo3.getLoc());
		
		// 삽입
		/*DeptVO vo4 = new DeptVO();
		vo4.setDname("상준띠");
		vo4.setLoc("Acorn");
		ss.insert("deptInsertOne", vo4);
		System.out.println("----------");*/
		
		// 수정
	/*	DeptVO vo4 = new DeptVO();
		vo4.setDname("Atomi");
		vo4.setLoc("Acorn");
		vo4.setDeptno(27);
		ss.update("deptUpdateOne", vo4);*/
		
		// 삭제
		ss.delete("deptDeleteOne", 16);
		
		List<DeptVO> list1 = ss.selectList("deptAll");
		for(DeptVO vo5 : list1) {
			System.out.println("----------");
			System.out.println("부서번호: " + vo5.getDeptno());
			System.out.println("부서명: " + vo5.getDname());
			System.out.println("부서위치: " + vo5.getLoc());
		}
		
		
	}
}
