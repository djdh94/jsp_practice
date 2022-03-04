package kr.co.ict.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/boardList")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// 1. 접속시 BoardDAO생성
		BoardDAO dao = BoardDAO.getInstance();
	// 2. BoardDAO의 getALLBoardList() 호출해 전체 게시글 정보 받아오기
	List<BoardVO> boardList=dao.getAllBoardList();
	// 3. request.setAttribute로 바인딩하기
	request.setAttribute("boardList", boardList);
	// 4. /board/boardlist.jsp로 포워딩하기
	// 포워딩후 el로 바인딩한 자료를 화면에 뿌려보기
	RequestDispatcher dt = request.getRequestDispatcher("/board/boardlist.jsp");
	
	dt.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
