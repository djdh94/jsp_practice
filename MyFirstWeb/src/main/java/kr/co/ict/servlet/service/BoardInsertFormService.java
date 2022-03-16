package kr.co.ict.servlet.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardInsertFormService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		HttpSession session = request.getSession();
		String sId =(String)session.getAttribute("session_id");
		System.out.println("insertForm.do:"+sId);
		// 글쓰기창에 아이디를 보내서 로그인 사용자 명이 곧 아이디로 쓰이도록 처리
		request.setAttribute("sId", sId);
		if(sId==null) {	
		RequestDispatcher dp = request.getRequestDispatcher("/boardList.do");
		dp.forward(request, response);
		}
		return; //포워딩후에 execute선에서 메서드가 종료되게 해서 FrontController쪽 실행을 방지하면 에러가 안뜸
	}

}
