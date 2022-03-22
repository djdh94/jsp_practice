package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;

public class BoardUpdateService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String snum = request.getParameter("board_num");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		int bnum = Integer.parseInt(snum);
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.getBoardUpdate(title, content, bnum);
		
	}

}
