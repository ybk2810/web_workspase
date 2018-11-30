package ex3;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mc.do")
public class Mycontroller3 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String type = req.getParameter("type");
		String url = "";
		String msg ="";
		ActionCommand ac = null;
		
		if(type==null || type.equals("hello")) {
			ac = new HelloCommand();
			url = ac.execute(req,resp);
		}else if(type.equals("ip")) {
			ac = new IPCommand();
			url = ac.execute(req,resp);
		}else if(type.equals("board")) {
			ac = new BoardCommand();
			url = ac.execute(req,resp);
		}
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
}
