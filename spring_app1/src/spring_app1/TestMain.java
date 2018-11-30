package spring_app1;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;

public class TestMain {
	public static void main(String[] args) {
		/*Hello h = new Hello();
		h.sayHello("홍길동");*/
		
		// 홍길동님 안녕하세요
		
		BeanFactory factory = new XmlBeanFactory(new FileSystemResource("src/app.xml"));
		
		Object obj1 = factory.getBean("h1");
		Object obj2 = factory.getBean("h2");
		Object obj3 = factory.getBean("h3");
		
		System.out.println("obj1: " + obj1);
		System.out.println("obj2: " + obj2);
		System.out.println("obj3: " + obj3);

		Hello h1 = (Hello)obj1;
		Hello h2 = (Hello)obj2;
		Hello h3 = (Hello)obj3;
		
		h1.sayHello("홍길동");
		h2.sayHello("홍길동");
		h3.sayHello("홍길동");
	}
}
