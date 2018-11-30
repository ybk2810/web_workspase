package ex3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ActionCommand {
	public String execute(HttpServletRequest req, HttpServletResponse resp);
}
