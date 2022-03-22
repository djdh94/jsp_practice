package kr.co.ict.servlet.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;

public class BoardInsertService implements IBoardService {
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse response) {
		BoardDAO dao = BoardDAO.getInstance();
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String writer=request.getParameter("writer");
		dao.insertBoard(title, content, writer);
		
	}
}
