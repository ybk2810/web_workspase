package day2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servletTest.do")
public class HttpServletRequestEx extends HttpServlet {
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String ip = req.getRemoteAddr();
		String hostname = req.getRemoteHost();
		String user = req.getRemoteUser();
		int port = req.getRemotePort();
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");

		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Welcome</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>ip: " + ip + "</h1>");	
		out.println("<h1>hostname: " + hostname + "</h1>");	
		out.println("<h1>user: " + user + "</h1>");	
		out.println("<h1>port: " + port + "</h1>");	
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
