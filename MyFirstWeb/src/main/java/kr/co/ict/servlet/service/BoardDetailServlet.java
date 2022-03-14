package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

public class BoardDetailServlet implements IBoardService{

	@Override
	public void execute(HttpServletRequest request,HttpServletResponse response) {
		BoardDAO dao = BoardDAO.getInstance();
		String snum= request.getParameter("board_num");
		int bnum = Integer.parseInt(snum);
		
		BoardVO board = dao.getBoardDetail(bnum);
		request.setAttribute("board", board);
	}
}
