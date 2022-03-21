package kr.co.ict.servlet;

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
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/boardupdateForm")
public class BoardUpdateServletForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServletForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String snum=request.getParameter("board_num");
		int bnum=Integer.parseInt(snum);
		// 수정버튼을 눌렀을때 글제목,글내용,글쓴이 등이 기입된 상태로 수정창이 열려야함
		// 기입된 상태가 되려면 먼저 입력된글번호에 해당하는 글 정보를 db에서 자바로 가져와야함
		// 글 번호 입력시 해당 번호 글의 정보를 가져오는 로직은 boardDAO의 getboarddetail()에 작성되어있음
		BoardDAO dao = BoardDAO.getInstance();
		BoardVO board = dao.getBoardDetail(bnum);
		request.setAttribute("board", board);
		RequestDispatcher dp = request.getRequestDispatcher("");
		dp.forward(request, response);
		
		
	}

}
