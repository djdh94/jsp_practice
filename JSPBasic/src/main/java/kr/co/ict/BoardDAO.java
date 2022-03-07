package kr.co.ict;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	private DataSource ds =null;
	
	   private static BoardDAO dao = new BoardDAO();
		  private BoardDAO() {
			  try {
				  Context ct = new InitialContext();
				  ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
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
		  public List<BoardVO> getAllBoardtest(){
			   Connection con = null;
			   PreparedStatement pmt=null;
			   ResultSet rs=null;
			   List<BoardVO> boardList = new ArrayList<>();
			   try {
				  con=ds.getConnection();
				   String sql="select*from boardinfo";
				   pmt=con.prepareStatement(sql);
				   rs=pmt.executeQuery();
				   while(rs.next()) {
					   int board_num=rs.getInt("board_num");
					    String title=rs.getString("title");
						String content=rs.getString("content");
						String writer=rs.getString("writer");
						Date bdate=rs.getDate("bdate");
						Date mdate=rs.getDate("mdate");
						 int hit=rs.getInt("hit");
					   BoardVO boardDate = new BoardVO(board_num,title,content,writer,bdate,mdate,hit);
					   boardList.add(boardDate);
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
			   return boardList;
		   }
}
