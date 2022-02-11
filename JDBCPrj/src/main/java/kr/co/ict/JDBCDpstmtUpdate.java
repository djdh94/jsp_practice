package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class JDBCDpstmtUpdate {

	public static void main(String[] args) {
		// update구문을 스캐너로 입력받아 로직작성
		String dbType="com.mysql.cj.jdbc.Driver";
		String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
		String dbId="root";
		String dbPw="mysql";
		try {
			Scanner scan = new Scanner(System.in);
			System.out.println("아이디를 입력해주세요");
			String id = scan.nextLine();
			System.out.println("변경할 비밀번호 입력");
			String pw= scan.nextLine();
			System.out.println("변경할 이름 입력");
			String name = scan.nextLine();
			System.out.println("변경할 이메일 입력");
			String email=scan.nextLine();
			
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(dbUrl,dbId,dbPw);
			String sql = "update userinfo set upw=?,uname=?,uemail=? where uid=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, pw);
			pst.setString(2, name);
			pst.setString(3, email);
			pst.setString(4, id);
			
			pst.executeUpdate();
			
			// .close()로 열린 자료 닫기
			// 일반 자바코드는 어차피 코드실행이 끝나면 프로그램이 강제로 종료되지만
			// 서버의 경우는 코드실행이 끝나도 서버가 계속 돌아가기때문에
			// 이를 막기 위해 .close()로 해제해야함
			con.close();
			pst.close();
			scan.close();
		}catch(Exception e) {
			e.getStackTrace();
		}finally {
			//종료 안내 구문
			System.out.println("수정로직 실행완료");
		}

	}

}
