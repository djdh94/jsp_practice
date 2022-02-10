package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCUpdate {

	public static void main(String[] args) {
		// update구문도 처리하기
		// update는 id는 변경하지 않습니다.
		// 어떤 아이디의 pw,name,email을 변경할지 조회하기 위해
		// 먼저 id를 받고, 그다음 pw,name,email을 받아서
		// update구문에서 조건절에 id를 넣어 타겟을 정하고
		// 나머지 항목만 수정되도록 처리
		String dbType="com.mysql.cj.jdbc.Driver";
		String dbUrl="jdbc:mysql://localhost:3306/jdbcprac1";
	    String dbId="root";
	    String dbPw="mysql";
		try {
			Scanner scan = new Scanner(System.in);
			System.out.println("아이디를 입력해주세요");
			String uid = scan.nextLine();
			System.out.println("비밀번호를 입력해주세요");
			String upw = scan.nextLine();
			System.out.println("이름을 입력해주세요");
			String uname = scan.nextLine();
			System.out.println("이메일을 입력해주세요");
			String uemail = scan.nextLine();
			// 1. 사용 db 지정하기
			Class.forName(dbType);
			
			// 2. java와 db 연동하기
			Connection con = DriverManager.getConnection(dbUrl,dbId,dbPw);
			
			// 3. 쿼리문 발송 준비하기
			Statement smt = con.createStatement();
			
			// 4. 쿼리문 실행전 찍어보기
			/*System.out.println("update userinfo set upw='"+upw+
								"',uname='"+uname+
								"',uemail='"+uemail+
								"' where uid='"+uid+"'");*/
			
			
			
			//System.out.println("update userinfo set uid="+uid+" where uname="+uname);
			smt.executeUpdate("update userinfo set upw='"+upw+"',uname='"+uname+"',uemail='"+uemail+"' where uid='"+uid+"'");
		
			// update userinfo set upw="유저입력비번",unmae="유저이름",uemail="유저이메일"
			// where uid="유저아이디";
		}catch(Exception e) {
			e.getStackTrace();
		}

	}

}
