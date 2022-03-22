package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

public class BoardDetailService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request,HttpServletResponse response) {
		
		String snum= request.getParameter("board_num");
		int bnum=0;
		if(snum !=null) {
			 bnum = Integer.parseInt(snum);
		}else {
			bnum=1;
		}
		
		BoardDAO dao = BoardDAO.getInstance();
		// 조회수 올리기
		dao.upHit(bnum);
		BoardVO board = dao.getBoardDetail(bnum);
		request.setAttribute("board", board);
	}
}
