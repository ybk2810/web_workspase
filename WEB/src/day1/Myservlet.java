package day1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//	http://localhost:8080/web/my.do

// http <-- http://
// ip: 주소 숫자: 0~255
// ipv4	: 0.0.0.0~255.255.255.255까지
//       	: 127.0.0.0 : loopback address
// 8080: port number
// 80: webserver
// web: context path: 웹에플리케이션의 ㅣㅇ름
// my.do: 자원의 위치정보

@WebServlet("/my.do")
public class Myservlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 브라우저에 전송할 내용
		
		// 문서 종류
		resp.setContentType("text/html;charSet=UTF-8");
		
		// 쓰기 종류
		PrintWriter out = resp.getWriter();
		
		// 전달할 내용
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Welcome</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Hello servlet</h1>");			
		out.println("</body>");
		out.println("</html>");
	}

}
