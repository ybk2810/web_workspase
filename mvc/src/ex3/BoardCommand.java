package ex3;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

public class BoardCommand implements ActionCommand {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		// 비지니스 로직
		// 게시판 전체 목록 가져오기
		BoardDAO dao = new BoardDAO();
		
		ArrayList<BoardVO> list = dao.selectAll(1, 20);
		
		dao.close();
		
		req.setAttribute("list", list);
		
		return "ex3/board.jsp";
	}
}
