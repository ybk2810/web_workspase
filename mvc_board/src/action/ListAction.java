package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

public class ListAction implements Action {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		BoardDAO dao = new BoardDAO();
		
		ArrayList<BoardVO> list = dao.selectAll(1, 20);
		
		dao.close();
		
		req.setAttribute("list", list);
		return "board/list.jsp";
	}
}
