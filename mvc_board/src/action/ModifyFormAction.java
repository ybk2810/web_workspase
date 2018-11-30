package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

public class ModifyFormAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		String n = req.getParameter("no");
		int no = 0;
		if(n != null) {
			no = Integer.parseInt(n);
			BoardDAO dao = new BoardDAO();
			dao.raiseHits(no);
			
			BoardVO vo =  dao.selectOne(no);
			dao.close();
			req.setAttribute("vo", vo);
		}
		return "board/modifyForm.jsp";
	}
}
