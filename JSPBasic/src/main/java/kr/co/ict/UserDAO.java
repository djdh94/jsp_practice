package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
	
	private String dbType="com.mysql.cj.jdbc.Driver";
	private String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
	private String dbId="root";
	private String dbPw="mysql";
	// 어떤 쿼리문을 실행하더라도 공통적으로 활용하는부분
	public UserDAO() {
		try {
		Class.forName(dbType);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	//실행 결과로 List<UserVO> 리턴, select 이외는 void로 리턴
	public List<UserVO> getAllUserList(){
		Connection con=null;
		PreparedStatement pmt=null;
		ResultSet rs=null;
		List<UserVO> userList= new ArrayList<>();
		try {
			con=DriverManager.getConnection(dbUrl,dbId,dbPw);
			String sql="select*from userinfo";
			pmt=con.prepareStatement(sql);
			rs=pmt.executeQuery();
			while(rs.next()) {
				String name=rs.getString(1);
				String id=rs.getString(2);
				String pw=rs.getString(3);
				String email=rs.getString(4);
				UserVO userDate=new UserVO(name,id,pw,email);
				userList.add(userDate);
			}
		}catch(Exception e) {
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
		return userList;
	}
}
