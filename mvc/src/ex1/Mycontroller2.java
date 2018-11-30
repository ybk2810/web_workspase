package ex1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mycon.do")
public class Mycontroller2 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		// 한글 처리
		resp.setContentType("text/html;charset=UTF-8");
		String cmd = req.getParameter("cmd");
		PrintWriter out = resp.getWriter();

		String url = "";
		String msg ="";
		if(cmd==null || cmd.equals("kr")) {
			url = "ex2/kr.jsp";
			msg="안녕하세요";
			req.setAttribute("msg", msg);
		}else if(cmd.equals("jp")) {
			url = "ex2/jp.jsp";
			msg = "곤니찌와";
			req.setAttribute("msg", msg);
		}else if(cmd.equals("cn")) {
			url = "ex2/cn.jsp";
			msg = "니하오";
			req.setAttribute("msg", msg);
		}else if(cmd.equals("th")) {
			url = "ex2/th.jsp";
			msg = "싸와디캄";
			req.setAttribute("msg", msg);
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
