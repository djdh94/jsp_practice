package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

public class BoardUpdateFormService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String snum = request.getParameter("board_num");
		int bnum = Integer.parseInt(snum);
		BoardDAO dao= BoardDAO.getInstance();
		BoardVO board=dao.getBoardDetail(bnum);
		request.setAttribute("board", board);
		
		
	}

}
