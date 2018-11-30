package day1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/welcome.do")
public class WelcmeServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//사용자 브라우저에 전달한 내용을 쓰기
		
		//문서 종류 지정
		resp.setContentType("text/html;charset=UTF-8");
		
		//쓰기 객체
		PrintWriter out = resp.getWriter();
		
		//출력
		out.println("<html>");
		
		out.println("<head>");
		out.println("<title>점심메뉴 고르기</title>");
		out.println("<style type='text/css'>");
		out.println("ol{font-size:42px;}");
		out.println("</style>");
		out.println("</head>");
		
		out.println("<body>");
		out.println("<h1>hahaha... hungry sb</h1>");	
		out.println("<h1>메뉴</h1>");
		out.println("<ol>");
		out.println("<li>햄버거</li>");
		out.println("<li>냉면</li>");
		out.println("<li>냉면+제육</li>");
		out.println("<li>라면</li>");
		out.println("</ol>");
		out.println("</body>");
		out.println("</html>");
		out.println("<h1>...</h1>");
	}
	
}
