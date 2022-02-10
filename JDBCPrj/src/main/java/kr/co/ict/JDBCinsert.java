package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCinsert {

	public static void main(String[] args) {
		// 스캐너로 id,pw,name,email을 입력받아
		// insert into 구문을 이용해 db에 데이터를 적재하도록 만들기
		// select q1처럼 작성하기(입력받기,db연결,쿼리문실행)
		// select구문을 제외한 나머지 insert,delete,update 구문은
		// 결과 데이터가 없기 때문에 실행했을때 에러가 나지 않는다면
		// 우선 실행된것으로 볼 수 있고, 실행이 된 다음 워크벤치에서
		// 데이터가 들어갔는지 확인
		
		// 쿼리문 실행시 select구문은 executeQuery(구문); 을 호출했지만
		// select이외 구문은 executeUpdate(구문);을 호출합니다.
		
		try {
			Scanner scan = new Scanner(System.in);
			System.out.println("이름을 입력해주세요");
			String uname = scan.nextLine();
			System.out.println("아이디를 입력해주세요");
			String uid = scan.nextLine();
			System.out.println("패스워드를 입력해주세요");
			String upw = scan.nextLine();
			System.out.println("이메일을 입력해주세요");
			String uemail = scan.nextLine();
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac1","root","mysql");
			Statement stmt = con.createStatement();
			
			stmt.executeUpdate("insert into userinfo value("+"'"+uname+"',"+"'"+uid+"',"+"'"+upw+"',"+"'"+uemail+"')");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		

	}

}
