package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// DAO 클래스는 DB연동을 전달하여 처리합니다.
public class UserDAO {
	
	// DB접속에 필요한 변수들을 아래 선언
	private String dbType = "com.mysql.cj.jdbc.Driver";
	private String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	private String dbId = "root";
	private String dbPw = "mysql";
	
	// 생성할 때 자동으로 Class.forName()을 실행하게 만듭니다.
	// 어떤 구문을 실행하더라도 공통적으로 활용하는 부분
	public UserDAO() {
		try {
			Class.forName(dbType);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	// user_list2.jsp의 코드 로직을 대체하기
	// user_list2.jsp에서 전체 유저 목록을 필요로 하기 떄문에
	// 실행 결과로 List<UserVO>를 리턴해줘야 합니다.
	// 역시 select구문을 실행할떄에는 리턴자료가 필요하고
	// insert,delete,update구문을 실행할떄는 리턴자료가 void입니다.
	public List<UserVO> getAllUserList(){
		//try블럭 진입 전에 커넥션,프리,리절트 선언
		
		// try블럭 진입 전에 ArrayList 선언
		
		Connection con = null;
		PreparedStatement pmt = null;
		ResultSet  rs = null;
		List<UserVO> userList = new ArrayList<>();
	try {
		// Connection,PreparedStatement,ResultSet을 선언
		con = DriverManager.getConnection(dbUrl, dbId,dbPw);
		// 3. select*from userinfo 실행 및 resultset에 저장
		String sql="select*from userinfo";
		pmt = con.prepareStatement(sql);
		rs = pmt.executeQuery();
		
		// UserVO ArrayList에 rs에 든 모든 자료를 저장해주세요
		while(rs.next()) {
		String name=rs.getString(1);
		String id=rs.getString("uid");
		String pw=rs.getString(3);
		String email=rs.getString("uemail");
		
		UserVO userDate = new UserVO(name,id,pw,email);
		userList.add(userDate);
			
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
		
	return userList;	
	}
	// login_update.jsp의 경우 로그인한 유저 한 명의 데이터만 db에서 얻어옵니다.
	// 따라서, 그 한 명의 유저 데이터만을 이용해 select구문을 써야합니다
	// login_update.jsp 상단의 sId 변수에 들어있는 유저명을 이용해 유저데이터를 얻어옵니다.
	public UserVO getUserDate(String sId) {
		// 접속로직은 getAllUserList()와 큰 차이가 없고 쿼리문만 좀 다릅니다.
		
		return null; //db에서 uservo에 데이터를 받아주신 다음 null 대신 받아온 데이터를 리턴 
	}
}
