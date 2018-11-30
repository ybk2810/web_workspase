package day2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/selectHobby.do")
public class Hobby extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String[] hobbyList = req.getParameterValues("hobby");
		
		resp.setContentType("text/html;charSet=UTF-8");
		PrintWriter out = resp.getWriter();
		
		// 전달할 내용
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Welcome</title>");
		out.println("</head>");
		out.println("<body>");
		
		out.println("<h1>당신의 취미는  ");
		
		for(String x: hobbyList) {
			out.println(x);
		}
		out.println(" 입니다.</h1>");
		
		out.println("</body>");
		out.println("</html>");
	}

}
