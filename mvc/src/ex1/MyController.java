package ex1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/MyController")
public class MyController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
	
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		// 한글 처리
		resp.setContentType("text/html;charset=UTF-8");
		String cmd = req.getParameter("cmd");
		PrintWriter out = resp.getWriter();
		/*out.println(cmd);*/
		String url = ""; // 찾아갈 페이지의 url을 갖는 변수
		String msg =""; // 전달할 메세지를 담을 변수
		if(cmd==null || cmd.equals("hello")) {
			msg="안녕하세요";
			req.setAttribute("msg", msg);
			url = "hello.jsp";
		}else if(cmd.equals("ip")) {
			String ip = req.getRemoteAddr();
			msg = "당신의 IP는 " + ip + "입니다.";
			req.setAttribute("msg", msg);
			url = "ip.jsp";
			/*사용자의 IP를 출력*/
			/*ip.jsp*/
			
		}else {
			url="welcome.jsp";
		}
		
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
		// forward
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}