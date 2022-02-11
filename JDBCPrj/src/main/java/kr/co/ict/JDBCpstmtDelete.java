package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class JDBCpstmtDelete {

	public static void main(String[] args) {
		// delete 구문을 실행하는 코드 작성
		// 삭제의 기준은 uid가 일치하는 자료를 삭제
		// 작성순서
		// 1. 스캐너로 삭제할 회원 uid 입력받기
		// 2. DB와 자바 연결
		// 3. 쿼리문에 ?를 포함해 작성한 후 PreparedStatment 객체 생성
		// 4. 실행
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
		String sql = "delete from userinfo where uid=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, uid);
		pst.executeUpdate();
		
		}catch(Exception e){
			e.getStackTrace();
		}

	}

}
