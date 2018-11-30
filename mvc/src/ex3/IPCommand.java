package ex3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IPCommand implements ActionCommand {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		String ip = req.getRemoteAddr();
		req.setAttribute("msg", ip);
		return "ex3/ip.jsp";
	}
}
