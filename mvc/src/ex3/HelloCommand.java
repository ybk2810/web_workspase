package ex3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloCommand implements ActionCommand {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		req.setAttribute("msg", "이건 모델에서 전달해주는 데이터");
		
		return "ex3/hello.jsp";
	}
}
