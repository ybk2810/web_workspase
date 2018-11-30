package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

public class InsertAction implements Action {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		BoardDAO dao = new BoardDAO();
		
		String writer = req.getParameter("writer");
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		BoardVO vo = new BoardVO();
		
		vo.setTitle(title);
		vo.setContents(contents);
		vo.setWriter(writer);
		dao.add(vo);
		dao.close();
		
		return "board.do?cmd=list";
	}
}
