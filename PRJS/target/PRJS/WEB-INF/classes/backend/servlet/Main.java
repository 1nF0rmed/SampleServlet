package backend.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.PrintWriter;

public class Main extends HttpServlet {
	private static final long serialVersionUID = 1234556L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Handler user input
		//String USN = request.getParameter("USN");
		
		PrintWriter out =response.getWriter();
		out.println("Hello World");
		//RequestDispatcher view = request.getRequestDispatcher("/html/findCourse.html");
		//view.forward(request, response);
	}
}