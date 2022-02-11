package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class JDBCpstmtinsert {

	public static void main(String[] args) {
		// insert 구문 작성
		// 변수로 접속정보 관리
		String dbType="com.mysql.cj.jdbc.Driver";
		String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
		String dbId="root";
		String dbPw="mysql";
		try {
			// 0. 스캐너로 insert에 필요한 정보 입력받기
			Scanner scan =new Scanner(System.in);
			System.out.println("추가할 아이디 입력");
			String id = scan.nextLine();
			System.out.println("추가할 패스워드 입력");
			String pw = scan.nextLine();
			System.out.println("추가할 이름 입력");
			String name = scan.nextLine();
			System.out.println("추가할 이메일 입력");
			String email= scan.nextLine();
			
			// 1. 접속정보 정의 및 db연결
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(dbUrl,dbId,dbPw);
			// 2. 쿼리문 생성
			String sql = "insert into userinfo value(?,?,?,?)";
			// 3. pstmt 생성 및 ?에 변수 매칭
			PreparedStatement pst = con.prepareStatement(sql);
			// 4. 실행
			pst.setString(1, name);
			pst.setString(2, id);
			pst.setString(3, pw);
			pst.setString(4, email);
			pst.executeUpdate();
		}catch(Exception e) {
			e.getStackTrace();
		}
	

	}

}
