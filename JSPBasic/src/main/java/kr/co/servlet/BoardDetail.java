package kr.co.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

/**
 * Servlet implementation class BoardDetail
 */
@WebServlet("/boarddetail")
public class BoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String snum = request.getParameter("board_num");
		int bnum = Integer.parseInt(snum);
		BoardDAO dao = BoardDAO.getInstance();
		BoardVO board = dao.getdetail(bnum);
		request.setAttribute("board", board);
		RequestDispatcher dp = request.getRequestDispatcher("/board/boarddetail.jsp");
		dp.forward(request, response);
	}

}
