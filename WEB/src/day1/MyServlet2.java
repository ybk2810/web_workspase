package day1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/my2.do")
public class MyServlet2 extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 브라우저에 전송할 내용
		
		// 문서 종류
		resp.setContentType("text/html;charSet=UTF-8");
		
		// 쓰기 종류
		PrintWriter out = resp.getWriter();
		
		// 전달할 내용
		out.println("<html>");
		out.println("<head>");
		out.println("<title>YB</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>name: YB</h1>");			
		Date d = new Date();
		out.println("<h1>date: "+d+"</h1>");
		out.println("</body>");
		out.println("</html>");
	}

}
