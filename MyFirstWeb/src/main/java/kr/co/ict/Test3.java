package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Test3 {
	private String dbType="com.mysql.cj.jdbc.Driver";
	 private String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
	 private String dbId="root";
	 private String dbPw="mysql";
	 
	 public Test3() {
		 try {
		 Class.forName(dbType);
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
	
	 }
	 public UserVO getUserDate(String id) {
		 Connection con = null;
		 PreparedStatement pmt=null;
		 ResultSet rs = null;
		 UserVO user = null;
		 try {
			 con=DriverManager.getConnection(dbUrl,dbId,dbPw);
			 String sql = "select*from userinfo where uid=?";
			 pmt=con.prepareStatement(sql);
			 pmt.setString(1, id);
			 rs=pmt.executeQuery();
			 if(rs.next()) {
				 String fname=rs.getString(1);
				 String fid=rs.getString(2);
				 String fpw=rs.getString(3);
				 String femail=rs.getString(4);
				 
				 user= new UserVO(fname, fid, fpw, femail);
				 
			 }
		 }catch(Exception e) {
			e.printStackTrace(); 
		 }
		 return user;
	 }
	 public void updateset(String uId, String uPw, String uName, String uEmail) {
			Connection con = null;
			PreparedStatement pmt=null;
			
			try {
				con=DriverManager.getConnection(dbUrl,dbId,dbPw);
				String sql ="update userinfo set uname=?,upw=?,uemail=? where uid=?";
				pmt=con.prepareStatement(sql);
				pmt.setString(1, uName);
				pmt.setString(2, uPw);
				pmt.setString(3, uEmail);
				pmt.setString(4, uId);
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
}
