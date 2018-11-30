package day2;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

// 서블릿 작성방법
// 1. HttpServlet 상속
// 2. GenericServlet 상속
@WebServlet("/service.do")
public class MyServlet3 extends GenericServlet {
	
	@Override
	public void init() throws ServletException {
		System.out.println("init() 호출중");
	}
	
	@Override
	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
		System.out.println("서비스 메서드 호출중");
	}
	
	@Override
	public void destroy() {
		System.out.println("destroy() 호출중");
	}
}
