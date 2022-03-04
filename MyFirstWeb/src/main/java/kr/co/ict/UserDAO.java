package kr.co.ict;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// DAO 클래스는 DB연동을 전달하여 처리합니다.
public class UserDAO {
	
	// DB접속에 필요한 변수들을 아래 선언
	// 커넥션풀 처리로 인한 미사용
	/*private String dbType = "com.mysql.cj.jdbc.Driver";
	private String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	private String dbId = "root";
	private String dbPw = "mysql";*/
	private DataSource ds =null;
	
	// 생성할 때 자동으로 Class.forName()을 실행하게 만듭니다.
	// 어떤 구문을 실행하더라도 공통적으로 활용하는 부분
	/*public UserDAO() {
		try {
			Class.forName(dbType);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}*/
	// 싱글된 패턴 처리
	// 3. 멤버변수로 UserDAO를 하나 생성해줍니다.
	private static UserDAO dao = new UserDAO();
	// 싱글턴은 요청시마다 DAO를 매번 새로 생성하지 않고, 먼저 하나를 생성해둔 다음
	// 사용자 요청때는 이미 생성된 DAO의 주소값만 공유해서
	// DAO생성에 필요한 시간을 절약하기 위해 사용합니다.
	// 1. 생성자는 private로 처리해 외부에서 생성명령을 내릴수 없게처리
	private UserDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 2. static 키워드를 이용해서 단 한번만 생성하고, 그 이후로는
	// 주소를 공유하는 getInstance() 메서드를 생성합니다.
	public static UserDAO getInstance() {
		if(dao==null) {
			dao=new UserDAO();
		}
		return dao;
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
		con=ds.getConnection();
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
	public UserVO getUserData(String id) {
		// 접속로직은 getAllUserList()와 큰 차이가 없고 쿼리문만 좀 다릅니다.
		
		// 1.커넥션,프리페어드,리절트 변수선언
		Connection con = null;
		PreparedStatement pmt = null;
		ResultSet rs = null;
		UserVO user=null;
		
		// 2. db연결
		try {
			con=ds.getConnection();
		
		// 3. 쿼리문날려 rs에 db에서 가져온 정보 받기
			String sql = "select*from userinfo where uid=?";
			pmt = con.prepareStatement(sql);
			pmt.setString(1, id);
			rs=pmt.executeQuery();
			
		// 4. UserVO 변수를 선언해주시고 , rs에 저장된 데이터를 UserVO에 담습니다.
			
			if(rs.next()) {
				String fname=rs.getString("uname");
				String fid=rs.getString("uid");
				String fpw=rs.getString("upw");
				String femail=rs.getString("uemail");
				user= new UserVO(fname,fid,fpw,femail);
				
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
		
		return user; //db에서 uservo에 데이터를 받아주신 다음 null 대신 받아온 데이터를 리턴 
	}
	public void userUpdate(String id,String pw,String name,String email) {
		Connection con=null;
		PreparedStatement pmt=null;
		try {
			con=ds.getConnection();
			String sql="update userinfo set uname=?,upw=?,uemail=? where uid=?";
			pmt=con.prepareStatement(sql);
			pmt.setString(1, name);
			pmt.setString(2, pw);
			pmt.setString(3, email);
			pmt.setString(4, id);
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
	// updateCheck에 필요한 userUpdate메서드를 아래에 정의해주세요
	// update구문을 실행하기 때문에 리턴 자료가 필요없고
	// update_check.jsp에 있는 쿼리문을 실행하기 위해
	// id,pw,name,email정보를 모두 받아옵니다.
	
	
	
	// member_out.jsp에서 사용할 탈퇴기능을 DAO로 이전시키겟습니다.
	// 메서드명은 deleteUser(String sId)입니다.
	// DAO파일에 생성하신 후, member_out.jsp에서도 해당 메서드를 쓰도록 고치기
	// 1. DAO에 메서드 생성후 보내기
	// 2. 고친로직을 실행하는 member_out.jsp의 스크립트릿도 추가로 보내기
	public void deleteUser(String sId) {
		Connection con=null;
		PreparedStatement pmt=null;
		try {
			con=ds.getConnection();
			String sql="delete from userinfo where uid=?";
			pmt=con.prepareStatement(sql);
			pmt.setString(1, sId);
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
	// 회원가입 로직 insertUser처리
	public void insertUser(String name, String id, String pw, String email) {
		Connection con=null;
		PreparedStatement pmt=null;
		
		try {
			con=ds.getConnection();
			String sql="insert into userinfo values(?,?,?,?)";
			pmt=con.prepareStatement(sql);
			pmt.setString(1, name);
			pmt.setString(2, id);
			pmt.setString(3, pw);
			pmt.setString(4, email);
			pmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
				pmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
			
	
	
