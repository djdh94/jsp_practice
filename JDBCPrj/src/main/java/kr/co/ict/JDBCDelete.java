package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCDelete {

	public static void main(String[] args) {
		// 사용자가 Scanner로 아이디를 입력하면
		// 해당 아이디 정보가 DB에서 삭제되도록 로직작성
		// executeUpdate("실행문"); 으로 실행
		// 실행전에 sysout을 통하여 제대로 작성됬는지 확인
		
		String dbType="com.mysql.cj.jdbc.Driver";
		String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
	    String dbId="root";
	    String dbPw="mysql";
		try {
		Scanner scan = new Scanner(System.in);
		System.out.println("아이디를 입력해주세요");
		String uid = scan.nextLine();
		Class.forName(dbType);
		
		Connection con = DriverManager.getConnection(dbUrl,dbId,dbPw);
		Statement stmt = con.createStatement();
		stmt.executeUpdate("delete from userinfo where uid = '"+uid+"'");
		//stmt.executeUpdate(
		}catch(Exception e) {
			e.getStackTrace();
		}
		

	}

}
