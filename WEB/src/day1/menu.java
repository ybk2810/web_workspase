package day1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/selectMenu.do")
public class menu extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charSet=UTF-8");

		
		PrintWriter out = resp.getWriter();
		// 전달할 내용
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Welcome</title>");
		out.println("</head>");
		out.println("<body>");
		
//		out.println("<h1>id: "++"</h1>");
//		out.println("<h1>pw: "++"</h1>");
		
		out.println("</body>");
		out.println("</html>");
	}	
}
