package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteFormAction implements Action {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		return "board/writeForm.jsp";
	}
}
