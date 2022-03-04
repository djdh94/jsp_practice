package kr.co.ict;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	private DataSource ds=null;
	private static BoardDAO dao = new BoardDAO();
	private BoardDAO() {
		try {
			Context ct = new InitialContext();
			ds=(DataSource)ct.lookup("java:comp/env/jdbc/mysql");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static BoardDAO getInstance() {
		if(dao==null) {
			dao=new BoardDAO();
		}
		return dao;
	}
	
	// DAO코드 재활용하기
	// 1. UserDAO에서 주석처리가 안된부분만 getInstance()메서드 까지 가져옴
	// 2. ~~~DAO 로 되어있는 부분을 전부 현재 DAO클래스명으로 변경
	// 3. 필요한 로직과 유사한 메서드 복사해오기
	// 게시판 글 전체목록 가져오기->회원전체목록 가져오기를 통해 수정

	public List<BoardVO> getAllBoardList(){
		Connection con = null;
		PreparedStatement pmt = null;
		ResultSet  rs = null;
		List<BoardVO> boardList = new ArrayList<>();
	try {
		con=ds.getConnection();
		String sql="select*from boardinfo";
		pmt = con.prepareStatement(sql);
		rs = pmt.executeQuery();
		while(rs.next()) {
		int boardNum=rs.getInt("board_num");
		String title=rs.getString("title");
		String content=rs.getString("content");
		String writer=rs.getString("writer");
		Date bdate=rs.getDate(5);
		Date mdate=rs.getDate(6);
		int hit=rs.getInt(7);
		
		BoardVO boardDate = new BoardVO(boardNum,title,content,writer,bdate,mdate,hit);
		boardList.add(boardDate);
			
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		try {
		con.close();
		pmt.close();
		rs.close();
		}catch(SQLException se) {
			se.printStackTrace();
		}
	}
		
	return boardList;	
	}
}
