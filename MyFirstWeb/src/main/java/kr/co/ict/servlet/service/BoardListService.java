package kr.co.ict.servlet.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardDTO;
import kr.co.ict.BoardVO;

public class BoardListService implements IBoardService{

		@Override
		public void execute(HttpServletRequest request,HttpServletResponse response) {
		
		
		// 2. BoardDAO의 getALLBoardList() 호출해 전체 게시글 정보 받아오기
		// 방법 1.int pNum=Integer.parseInt(request.getParameter("pageNum"));
		String snum=request.getParameter("pageNum");
		int pNum=0;
		//if(snum ==null) {
		//	pNum=1;
		//}else {
		//	pNum=Integer.parseInt(snum);	
		//}
		try {
			pNum=Integer.parseInt(snum);
		}catch(Exception e) {
			pNum=1;
		}
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardVO> boardList=dao.getAllBoardList(pNum);
		// 3. request.setAttribute로 바인딩하기
		request.setAttribute("boardList", boardList);
		
		
		// 페이지 버튼 생성을 위한 글 개수 확인하기
		int boardCount=dao.getPageNum();
		// 아래에 dto를 생성해주시고 바인딩까찌 하기
		BoardDTO dto = new BoardDTO(boardCount, pNum);
		System.out.println("페이징 처리 정보:"+dto);
		request.setAttribute("dto", dto);
		
		
		//로그인 여부는 세션값을 저장한 다음, 바인딩해서 .jsp페이지에서 확인합니다.
		// 서블릿 내부에서 세션 쓰는법
		// 1. 세션 객체 생성(.jsp 내부에서는 자동으로 생성되는 "내장 객체" 이지만 서블릿 로직 하에서는 생성해줘야 쓸수있음.)
		HttpSession session = request.getSession();
		// 2. .jsp의 스크립트릿 내부와 동일하게 세션값 얻어오기 가능(setAttribute로 저장도 가능)
		String sId = (String)session.getAttribute("session_id");
		System.out.println("로그인여부"+sId);
		// 세션값 체킹이 확인되면 바인딩해서 포워딩시 세션값이 같이 넘어가도록 처리
		request.setAttribute("sId", sId);
	}
}