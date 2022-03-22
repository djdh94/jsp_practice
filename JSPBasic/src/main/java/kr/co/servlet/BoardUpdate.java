package kr.co.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;

/**
 * Servlet implementation class BoardUpdate
 */
@WebServlet("/boardUpdate")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String snum=request.getParameter("board_num");
		int bnum = Integer.parseInt(snum);
		String title=request.getParameter("title");
		String content = request.getParameter("content");
		BoardDAO dao = BoardDAO.getInstance();
		dao.getUpdate(title, content, bnum);
		response.sendRedirect("http://localhost:8181/JSPBasic/boarddetail?board_num="+bnum);
		
		
	}

}
