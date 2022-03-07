package kr.co.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/test2")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("/test2 최초접속");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		System.out.println("파기");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/spring 주소 접속 확인");
		String jsp = request.getParameter("jsp");
		String boot = request.getParameter("boot");
		System.out.println(jsp+boot);
		String jpa = request.getParameter("jpa");
		System.out.println(jpa);
		
		request.setAttribute("jpa",jpa );
		request.setAttribute("jsp",jsp );
		request.setAttribute("boot",boot );
		RequestDispatcher dp = request.getRequestDispatcher("/servletForm/springGet.jsp");
		dp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/post식으로 접속");
		String jsp = request.getParameter("jsp");
		String boot = request.getParameter("boot");
		String jpa = request.getParameter("jpa");
		System.out.println(jsp+boot+jpa);
		// request.setAttribute("보낼이름",자료);
		request.setAttribute("jpa",jpa );
		request.setAttribute("boot", boot);
		request.setAttribute("jsp", jsp);
		RequestDispatcher dp = request.getRequestDispatcher("/servletForm/springResult.jsp");
		dp.forward(request, response);
	}

}
