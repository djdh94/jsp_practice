package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Test2 {
	private String dbType="com.mysql.cj.jdbc.Driver";
	 private String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
	 private String dbId="root";
	 private String dbPw="mysql";

	public Test2(){
		try {
	Class.forName(dbType);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<UserVO> getAllUserList(){
		Connection con =null;
		PreparedStatement pmt=null;
		ResultSet rs = null;
		List<UserVO> userList= new ArrayList<>();
		try {
			con=DriverManager.getConnection(dbUrl,dbId,dbPw);
			String sql="select*from userinfo";
			rs=pmt.executeQuery();
			
			while(rs.next()) {
				String name=rs.getString(1);
				String id=rs.getString(2);
				String pw=rs.getString(3);
				String email=rs.getString(4);
				
				UserVO userDate = new UserVO(name, id, pw, email);
				userList.add(userDate);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
		return userList;
	}
	
	public UserVO getUserDate(String id) {
		// 접속로직은 getAllUserList()와 큰 차이가 없고 쿼리문만 좀 다릅니다.
		
		// 1.커넥션,프리페어드,리절트 변수선언
		Connection con = null;
		PreparedStatement pmt = null;
		ResultSet rs = null;
		UserVO user=null;
		
		// 2. db연결
		try {
			con = DriverManager.getConnection(dbUrl,dbId,dbPw);
		
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

}
