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

	// 페이징 처리를 위해 페이지 번호를 추가로 입력받습니다.
	public List<BoardVO> getAllBoardList(int pageNum){
		Connection con = null;
		PreparedStatement pmt = null;
		ResultSet  rs = null;
		List<BoardVO> boardList = new ArrayList<>();
	try {
		con=ds.getConnection();
		int limitNum = ((pageNum-1)*20);
		// Limit 뒤쪽 숫자가 페이지당 보여줄 글 개수이므로 dto의 상수와 함께 고쳐야함.
		String sql="select*from boardinfo order by board_num desc limit ?,20";
		pmt = con.prepareStatement(sql);
		pmt.setInt(1, limitNum);
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
	
	// insertboard 내부 쿼리문 실행시 필요한 3개 요소인 글제목,본문,글쓴이를 입력해야만 실행할수있게 처리
	public void insertBoard(String title,String content,String writer) {
		Connection con=null;
		PreparedStatement pmt=null;
		try {
			con=ds.getConnection();
			// insert의 경우 두 가지 유형있음
			// 전체컬럼요소다넣기 - INSERT INTO boardinfo VALUES (null, ?, ?, ?, now(), now(), 0);
			// 일부 요소만 넣기 - INSERT INTO boardinfo(title, content, writer) VALUES (?, ?, ?);
			String sql = "insert into boardinfo(title,content,writer) value(?,?,?)";
			pmt=con.prepareStatement(sql);
			// 실행 전 상단 쿼리문 ? 채워넣기
			pmt.setString(1, title);
			pmt.setString(2, content);
			pmt.setString(3, writer);
			pmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
				pmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	
	}
	
	// 글 한개가 필요한 상황이므로 BoardVO 하나면 처리 가능
	public BoardVO getBoardDetail(int board_num) {
		Connection con=null;
		PreparedStatement pmt=null;
		ResultSet rs= null;
		BoardVO board = null;
		//upHit(board_num); // 조회수 올리는 로직을 실행한 다음 글정보 불러오게 처리
		try {
			con=ds.getConnection();
			String sql="select*from boardinfo where board_num=?";
			pmt=con.prepareStatement(sql);
			pmt.setInt(1, board_num);
			rs=pmt.executeQuery();
			
			if(rs.next()) {
				int boardNum=rs.getInt("board_num");
				String title=rs.getString("title");
				String content=rs.getString("content");
				String writer=rs.getString("writer");
				Date bdate=rs.getDate("bdate");
				Date mdate=rs.getDate("mdate");
				int hit = rs.getInt("hit");
				
				board=new BoardVO(boardNum,title,content,writer,bdate,mdate,hit);
				upHit(boardNum);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
				pmt.close();
				rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return board;
	}
	
	public void getBoardDelete(int boardnum) {
		Connection con=null;
		PreparedStatement pmt=null;
		try {
			con=ds.getConnection();
			String sql="delete from boardinfo where board_num=?";
			pmt=con.prepareStatement(sql);
			pmt.setInt(1, boardnum);
			pmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
				pmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void getBoardUpdate(String title,String content,int boardNum) {

		Connection con=null;
		PreparedStatement pmt=null;
		try {
			con=ds.getConnection();
			String sql="update boardinfo set title=?, content=?, mdate=now() where board_num=?";
			pmt=con.prepareStatement(sql);
			pmt.setString(1, title);
			pmt.setString(2, content);
			pmt.setInt(3, boardNum);
			pmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
				pmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	 
	
	//서비스가 아닌 getBoardDetail 실행시 자동으로 같이 실행되도록 처리하기
	// 글제목 클릭할떄마다 조회수를 상승시키는 메서드
	public void upHit(int strBId) {
		
		// update에 맞는 접속로직 작성하기(try~catch,connection,pstmt 생성등 까지만)
		Connection con =null;
		PreparedStatement psmt=null;
		try {
			con=ds.getConnection();
			String sql = "update boardinfo set hit =(hit+1) where board_num=?";
			
			psmt=con.prepareStatement(sql);
			psmt.setInt(1, strBId);
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 페이징 처리를 위해 글 전체 개수를 구해오기
	// 하단에 public int getPageNum()을 작성하기
	public int getPageNum() {
		Connection con=null;
		PreparedStatement pmt=null;
		ResultSet rs=null;
		int pageNum=0;
		try {
			con=ds.getConnection();
			String sql="select count(*) from boardinfo";
			pmt=con.prepareStatement(sql);
			rs=pmt.executeQuery();
			if(rs.next()) {
				pageNum=rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
				pmt.close();
				rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return pageNum;
	}
}
