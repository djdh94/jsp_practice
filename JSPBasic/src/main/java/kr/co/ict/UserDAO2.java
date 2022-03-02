package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO2 {
	   private String dbType="com.mysql.cj.jdbc.Driver";
	   private String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
	   private String dbId="root";
	   private String dbPw="mysql";
	   
	   public UserDAO2(){
		   try {
			   Class.forName(dbType);
		   }catch(Exception e) {
			   e.printStackTrace();
		   }
	   }
	   
	   public List<UserVO2> getAlltest(){
		   Connection con = null;
		   PreparedStatement pmt=null;
		   ResultSet rs=null;
		   List<UserVO2> userList = new ArrayList<>();
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
				   UserVO2 userDate = new UserVO2(name,id,pw,email);
				   userList.add(userDate);
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
		   return userList;
	   }
	   
	   public UserVO2 getUpdatetest(String fid) {
		   Connection con=null;
		   PreparedStatement pmt=null;
		   ResultSet rs=null;
		   UserVO2 user =null;
		   try {
			   con=DriverManager.getConnection(dbUrl,dbId,dbPw);
			   String sql="select*from userinfo where uid=?";
			   pmt=con.prepareStatement(sql);
			   pmt.setString(1, fid);
			   rs=pmt.executeQuery();
			   if(rs.next()) {
				   String name=rs.getString(1);
				   String id=rs.getString(2);
				   String pw=rs.getString(3);
				   String email=rs.getString(4);
				   user=new UserVO2(name,id,pw,email);
			   }
		   }catch(Exception e) {
			   e.printStackTrace();
		   }finally {
			   try {
				   
			   }catch(Exception e) {
				   e.printStackTrace();
			   }
		   }
		   return user;
	   }
	   
	   public void updateCheck(String name,String pw,String email,String id) {
		   Connection con =null;
		   PreparedStatement pmt=null;
		   
		   try {
			   con=DriverManager.getConnection(dbUrl,dbId,dbPw);
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
			   }catch(Exception e) {
				   e.printStackTrace();
			   }
		   }
	   }
	   
	  public void deleteUser(String id) {
		  Connection con =null;
		  PreparedStatement pmt=null;
		  try {
			  con=DriverManager.getConnection(dbUrl,dbId,dbPw);
			  String sql="delete from userinfo where uid=?";
			  pmt=con.prepareStatement(sql);
			  pmt.setString(1, id);
			  pmt.executeUpdate();
					  
		  }catch(Exception e) {
			  e.printStackTrace();
		  }finally {
			 try {
				 con.close();
				 pmt.close();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
			  
		  }
	  }
}
