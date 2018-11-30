package ex3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestCommand implements ActionCommand {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		return null;
	}
}
