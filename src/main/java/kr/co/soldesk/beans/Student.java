package kr.co.soldesk.beans;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

public class Student {

	private int student_idx;			//학생기본키
	private String student_name;		//학생이름
	private String student_gender;		//학생성별
	private Date student_birth;			//학생생년월일
	private String student_email;		//학생이메일
	private String student_phone;		//학생연락처
	private String student_team;		//학생 팀
	private String student_position;	//학생직책
	private String student_education;	//학생학력
	private String student_major;		//학생전공여부
	private String student_status;		//학생상태
	private String student_photo;		//학생사진
	
	@NotEmpty(message = "아이디를 입력하세요!!")
	private String student_id;
	private String student_pass;
	
	private boolean joinCheck;
	
	private int department_idx;			//과정번호
	
	private boolean check_email;		//회원가입 위한 이메일 체크
	
	public Student() {
		
		this.student_id = null;
		this.check_email = false;
	}
	
	public boolean isCheck_email() {
		return check_email;
	}


	public void setCheck_email(boolean check_email) {
		this.check_email = check_email;
	}


	public int getStudent_idx() {
		return student_idx;
	}
	
	public String getStudent_id() {
		return student_id;
	}



	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}



	public String getStudent_pass() {
		return student_pass;
	}



	public void setStudent_pass(String student_pass) {
		this.student_pass = student_pass;
	}



	public void setStudent_idx(int student_idx) {
		this.student_idx = student_idx;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getStudent_gender() {
		return student_gender;
	}

	public void setStudent_gender(String student_gender) {
		this.student_gender = student_gender;
	}

	public Date getStudent_birth() {
		return student_birth;
	}

	public void setStudent_birth(Date student_birth) {
		this.student_birth = student_birth;
	}

	public String getStudent_email() {
		return student_email;
	}

	public void setStudent_email(String student_email) {
		this.student_email = student_email;
	}

	public String getStudent_phone() {
		return student_phone;
	}

	public void setStudent_phone(String student_phone) {
		this.student_phone = student_phone;
	}

	public String getStudent_team() {
		return student_team;
	}

	public void setStudent_team(String student_team) {
		this.student_team = student_team;
	}

	public String getStudent_position() {
		return student_position;
	}

	public void setStudent_position(String student_position) {
		this.student_position = student_position;
	}

	public String getStudent_education() {
		return student_education;
	}

	public void setStudent_education(String student_education) {
		this.student_education = student_education;
	}

	public String getStudent_major() {
		return student_major;
	}

	public void setStudent_major(String student_major) {
		this.student_major = student_major;
	}

	public String getStudent_status() {
		return student_status;
	}

	public void setStudent_status(String student_status) {
		this.student_status = student_status;
	}

	public String getStudent_photo() {
		return student_photo;
	}

	public void setStudent_photo(String student_photo) {
		this.student_photo = student_photo;
	}

	public int getDepartment_idx() {
		return department_idx;
	}

	public void setDepartment_idx(int department_idx) {
		this.department_idx = department_idx;
	}

	public boolean isJoinCheck() {
		return joinCheck;
	}

	public void setJoinCheck(boolean joinCheck) {
		this.joinCheck = joinCheck;
	}
	
	
	
}
