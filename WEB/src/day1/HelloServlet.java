package day1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//servlet: web에서 동작하는 자바 프로그램

//servlet
//1.HttpServlet 상속
//2.doGet(), doPoset() override
//3.서블릿 등록

@WebServlet("/hello.do")
public class HelloServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Hello Servlet World</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Hello servlet</h1>");			
		for(int i=1; i<100; i++) {
			out.println("<h3>Hello sibal</h3>");	
		}
		out.println("</body>");
		out.println("</html>");
	}
}
