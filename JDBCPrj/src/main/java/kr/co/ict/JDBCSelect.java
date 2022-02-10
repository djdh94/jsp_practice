package kr.co.ict;
// SQL 관련된 요소는 java.sql.*을 임폴트하면 대부분이 다 로드됨
import java.sql.*;

public class JDBCSelect {

	public static void main(String[] args) {
		// JDBC 연결 여부 확인
		try {
		// MYSQL을 연동할것임을 알리기 위해 forName 내부에 MySQL용 연동구문을 적음.
		// SQL연동은 try~catch블럭 내부에 넣도록 강제됨.
		Class.forName("com.mysql.cj.jdbc.Driver");
		// 커넥션 객체는 연결 여부를 확인합니다.
		// 입력요소는 접속주소,mysql 계정명,mysql 비밀번호 순으로 입력합니다.
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac1",
				"root","mysql");
		
		// 쿼리문을 연결된 mysql에 날려주기 위해, 쿼리문을 준비합니다.
		// 퀴리문은 Statement 라는 변수에 저장해 날려줍니다.
		Statement stmt = con.createStatement();
		// .executeQuery() 내부에 실행할 쿼립문을 매개변수로 작성합니다.
		// SELECT 구문은 실행할 때 executeQuery()를 실행
		// SELECT 문을 실행한 결과 자료는 ResultSet이라는 자료로 받을수있음
		ResultSet rs = stmt.executeQuery("SELECT*FROM userinfo");
		// stmt.executeUpdate()는 SELECT 이외의 구문, INSERT DELETE와 UPDATE를 실행할떄 씁니다.
		
		// ResultSet은 기본적으로 row개수만큼 내부에 데이터를 저장합니다. 
		// ResultSet은 특정 번호를 집어서 조회하는 경우보다 순차적으로 조회해서 씀
		// 맨 처음 ResultSet은 -1번이라는 임시번호를 타겟으로 잡음
		// 이번호를 옮기기 위해 .next()를 호출하면 다음번호로 이동
		//rs.next(); // 다음번호가 조회되면 true,없으면 false
		// get자료형(인덱스번호) or get자료형(컬럼명)을 쓰면
		// 해당 컬럼의 자료를 변환합니다.
		//System.out.println(rs.getString("uname"));
		//System.out.println(rs.getString("uid"));
		//System.out.println(rs.getString("upw"));
		//System.out.println(rs.getString("uemail"));
		
		// while문을 이용해서 select 구문의 전체 결과를 
		// 콘솔에 찍기 
		// 1,4번 컬럼은 컬럼명으로 출력 ,2,3 번 컬럼은 인덱스로 출력
		
		while(rs.next()) {
			System.out.println(rs.getString("uname"));
			System.out.println(rs.getString(2));
			System.out.println(rs.getString(3));
			System.out.println(rs.getString("uemail"));
			System.out.println("----------------");
			
		}
		
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
