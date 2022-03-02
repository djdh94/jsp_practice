package kr.co.ict.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletCustom
 */
@WebServlet("/spring")
public class ServletCustom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCustom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("/spring 최초접속");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	// get방식으로 해당 주소에 접속할 때마다 실행하는 메서드.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/spring 최초접속");
		// request.getParameter() 를 이용해
		// "jsp","boot" 라는 이름으로 들어온 요소를 콘솔에 찍도록 코드작성
		// doGet 메서드를 복사해서 보내기
		// 확인하는 방법은 ?jsp=값1&boot=값2 를 주소 뒤에 붙입니다
		String jsp=request.getParameter("jsp");
		String boot=request.getParameter("boot");
		System.out.println(jsp+","+boot);
		// "jpa"라는 이름으로 들어온 요소를 콘솔에 직도록 추가
		String jpa=request.getParameter("jpa");
		System.out.println(jpa);
		String test=request.getParameter("test");
		String test2=request.getParameter("test2");
		System.out.println(test+test2);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
