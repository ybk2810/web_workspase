package day2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/counter.do")
public class MyServlet4 extends HttpServlet {
	int cnt = 0;
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 실행 방문 횟수 출력
		
		// IP
		String ip = req.getRemoteAddr();
		
		cnt++;
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");

		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Welcome</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>방문횟수: " + cnt + "번째 게스트 입니다.</h1>");	
		out.println("<h1>당신의 IP: " + ip + "입니다.</h1>");
		out.println("<h1>허위 사실을 적시할 경우 형사처벌 대상입니다.</h1>");
		out.println("</body>");
		out.println("</html>");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("init() 호출중");
	}
	
	@Override
	public void destroy() {
		System.out.println("destroy() 호출중");
	}
	
	
}
