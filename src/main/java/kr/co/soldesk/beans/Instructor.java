package kr.co.soldesk.beans;

public class Instructor {
	
	private int instructor_idx;			//강사 기본키
	private String instructor_id;		//강사 ID
	private String instructor_pass;		//강사 PASS
	private String instructor_name;		//강사이름
	private String instructor_phone;	//강사 연락처
	private String instructor_email;	//강사 이메일
	private String instructor_photo;	//강사 사진
	
	public int getInstructor_idx() {
		return instructor_idx;
	}
	public void setInstructor_idx(int instructor_idx) {
		this.instructor_idx = instructor_idx;
	}
	public String getInstructor_id() {
		return instructor_id;
	}
	public void setInstructor_id(String instructor_id) {
		this.instructor_id = instructor_id;
	}
	public String getInstructor_pass() {
		return instructor_pass;
	}
	public void setInstructor_pass(String instructor_pass) {
		this.instructor_pass = instructor_pass;
	}
	public String getInstructor_name() {
		return instructor_name;
	}
	public void setInstructor_name(String instructor_name) {
		this.instructor_name = instructor_name;
	}
	public String getInstructor_phone() {
		return instructor_phone;
	}
	public void setInstructor_phone(String instructor_phone) {
		this.instructor_phone = instructor_phone;
	}
	public String getInstructor_email() {
		return instructor_email;
	}
	public void setInstructor_email(String instructor_email) {
		this.instructor_email = instructor_email;
	}
	public String getInstructor_photo() {
		return instructor_photo;
	}
	public void setInstructor_photo(String instructor_photo) {
		this.instructor_photo = instructor_photo;
	}
	
	
}
