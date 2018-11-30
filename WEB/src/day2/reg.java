package day2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/regOK.do")
public class reg extends HttpServlet {
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String ssn1 = req.getParameter("ssn1");
		String ssn2 = req.getParameter("ssn2");
		String pw = req.getParameter("pw");
		String front = req.getParameter("front");
		String middle = req.getParameter("middle");
		String last = req.getParameter("last");
		String addrs = req.getParameter("addrs");
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		String gender = req.getParameter("gender");
		String[] hobby = req.getParameterValues("hobby");
		
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");

		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPw(pw);
		vo.setName(name);
		
		dao.addMember(vo);
		
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Welcome</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>id: " + id + "</h1>");	
		out.println("<h1>name: " + name + "</h1>");	
		out.println("<h1>ssn: " + ssn1 + " - " + ssn2 + "</h1>");	
		out.println("<h1>pw: " + pw + "</h1>");	
		out.println("<h1>phon num: " + front + " - " + middle + " - " + last + "</h1>");	
		out.println("<h1>address: " + addrs + "</h1>");	
		out.println("<h1>email: " + email1 + "@" + email2 + "</h1>");	
		out.println("<h1>gender: " + gender + "</h1>");	
		out.println("<h1>hobby: ");
		for(String x: hobby) {
			out.println(x);
		}
		out.println(" 입니다.</h1>");
		
		out.println("</body>");
		out.println("</html>");
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
}
