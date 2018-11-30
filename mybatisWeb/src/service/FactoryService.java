package service;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FactoryService {
	private static SqlSessionFactory factory;
	
	static {
		// static block
		// 객체 생성전에 미리 실행되는 코드
		try {
			Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(r);
			r.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
