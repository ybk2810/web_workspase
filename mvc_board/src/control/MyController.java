package control;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.DeleteAction;
import action.DetailAction;
import action.InsertAction;
import action.ListAction;
import action.ModifyFormAction;
import action.ModifyOkAction;
import action.WriteFormAction;

@WebServlet("/board.do")
public class MyController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String cmd = req.getParameter("cmd");
		Action action = null;
		String url = "";
		
		if(cmd==null || cmd.equals("list")) {
			action = new ListAction();
		}else if(cmd.equals("write")) {
			action = new WriteFormAction();
		}else if(cmd.equals("insert")) {
			action = new InsertAction();
		}else if(cmd.equals("detail")) {
			action = new DetailAction();
		}else if(cmd.equals("modify")) {
			action = new ModifyFormAction();
		}else if(cmd.equals("modifyOk")) {
			action = new ModifyOkAction();
		}else if(cmd.equals("delete")) {
			action = new DeleteAction();
		}
		
		url = action.execute(req, resp);
		
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
}
