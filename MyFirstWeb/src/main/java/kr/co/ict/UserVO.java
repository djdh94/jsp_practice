package kr.co.ict;

public class UserVO {
	// vo는 특정 테이블의 자료를 자바형식으로 저장하기 위해 선언합니다.
	// 그래서 sql 데이터를 자바로 옮겨오기 위해서
	// 1. 담당할 테이블의 컬럼을 전부 변수로 만들기
	private String uName;
	private String uId;
	private String uPw;
	private String uEmail;
	
	// 2. 생성자 , getter,setter 만들기
	
	public String getuName() {
		return uName;
	}
	public UserVO(String uName, String uId, String uPw, String uEmail) {
		super();
		this.uName = uName;
		this.uId = uId;
		this.uPw = uPw;
		this.uEmail = uEmail;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	// 3. (선택)toString을 만들어주세요
	// toString은 콘솔이나 화면에 UserVO를 찍었을때 주소대신 내부 데이터가 나오도록 조회해줌
	// source-> generate toString()
	@Override
	public String toString() {
		return "UserVO [uName=" + uName + ", uId=" + uId + ", uPw=" + uPw + ", uEmail=" + uEmail + "]";
	}
	
	// 3. (선택)toString 만들기
	
}

