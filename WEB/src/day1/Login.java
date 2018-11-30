package day1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/LoginOK.do")
public class Login extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charSet=UTF-8");
		doProcess(req, resp);
	}

	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		// 입력한 id값과 pw 값을 화면에 출력
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		MemberDAO dao = new MemberDAO();
		boolean isOK = dao.isExist(id, pw);

		
		PrintWriter out = resp.getWriter();
		// 전달할 내용
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Welcome</title>");
		out.println("</head>");
		out.println("<body>");
		if(isOK) {
			out.println("<h1>Hello Servlet</h1>");
			out.println("<h1>"+id+"님 환영합니디. </h1>");
		}else {
			out.println("회원가입후 사용하실수 있는 기능입니다.");
			out.println("<a href='./Login.html'>로그인</a>");
		}
		out.println("</body>");
		out.println("</html>");
	}
}
