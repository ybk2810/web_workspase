package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

public class ModifyOkAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		String n = req.getParameter("no");
		int no = 0;
		if(n != null) {
			no = Integer.parseInt(n);
			String title = req.getParameter("title");
			String writer = req.getParameter("writer");
			String contents = req.getParameter("contents");
			
			BoardVO vo =  new BoardVO();
			vo.setBno(no);
			vo.setTitle(title);
			vo.setContents(contents);
			vo.setWriter(writer);
			
			BoardDAO dao = new BoardDAO();
			dao.modify(vo);
			dao.close();
		}
		return "board.do?cmd=list";
	}
}
