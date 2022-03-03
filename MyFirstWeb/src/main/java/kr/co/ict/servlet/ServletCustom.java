package kr.co.ict.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
		System.out.println("/spring 접속시 생성된 객체는 서버 종료로 인해 파기");
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
		// "jpa"라는 이름으로 들어온 요소를 콘솔에 직도록 추가
		String test=request.getParameter("test");
		String test2=request.getParameter("test2");
		System.out.println(test+test2);
		//response.sendRedirect("http://localhost:8181/MyFirstWeb/servletForm/springResult.jsp");
		// 1. request.setAttribute()를 이용해 포워딩 목적지로 보낼 데이터 바인딩(저장)
		request.setAttribute("test",test);
		request.setAttribute("test2",test2);
		// 2. 목적지 설정 및 requestdispatcher 생성
		RequestDispatcher dt = request.getRequestDispatcher("/servletForm/springGetResult.jsp");
		dt.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doPost는 현재까지 배운 내용만 놓고 봤을때 form에서 post방식으로 제출될떄 호출됩니다
		System.out.println("/spring 주소 post방식으로 접속함");
		// servletForm 내부에 있던 ~~~Form.jsp의 목적지는 그대로 두고
		// 전송방식만 post로 바꿔서 데이터를 날리고
		// 받아서 처리하기
		// 대신 post방식으로 전송됨을 구분하기 위해서
		// sysout("post방식:"+변수명);
		request.setCharacterEncoding("utf-8");
		String test = request.getParameter("test");
		String test2 = request.getParameter("test2");
		System.out.println("post방식:"+test);
		System.out.println("post방식:"+test2);
		// 리다이렉트 방식은 페이지만 이동하고 데이터는 같이 전송하지 않습니다.
		//response.sendRedirect("http://localhost:8181/MyFirstWeb/servletForm/springResult.jsp");
		// 포워딩 하기전 request에 setAttribute()를 이용해 데이터를 저장합니다.
		// request.setAttribute("보낼이름",자료);
		request.setAttribute("test",test);
		request.setAttribute("test2",test2);
		// 상단 변수를 함께 전달하기위해 forward를 대신 사용합니다.
		// 목적지 주소는 localhost:포트번호/프로젝트명/이후경로
		RequestDispatcher dp = request.getRequestDispatcher("/servletForm/springResult.jsp");
		
		dp.forward(request, response);
	}

}
