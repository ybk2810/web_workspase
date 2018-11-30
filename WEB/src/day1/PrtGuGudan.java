package day1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PrtGuGuDan.do")
public class PrtGuGudan extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charSet=UTF-8");
		doProcess(req, resp);
	}
	
	//중복된 코드 => Refactor, Extract method
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 요청객체
		String dan = req.getParameter("dan");
		System.out.println("dan: " + dan);
		int d = Integer.parseInt(dan);
		// 쓰기 종류
		PrintWriter out = resp.getWriter();

		// 전달할 내용
		out.println("<html>");
		out.println("<head>");
		out.println("<title>3단</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>구구단: " + d + "단</h1>");
		for (int i = 1; i <= 9; i++) {
			out.println("<h1>" + d + " * " + i + " = " + d * i + "</h1>");
		}
		out.println("</body>");
		out.println("</html>");
	}
}
