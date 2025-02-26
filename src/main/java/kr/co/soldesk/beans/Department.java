package kr.co.soldesk.beans;

import java.sql.Date;

public class Department {
//과정
	private int department_idx;			//과정 기본키
	private String department_name;		//과정명
	private Date department_date;		//과정 개설일
	private String department_status;	//상태
	
	private int instructor_idx;			//강사
	private int mentor_idx;				//부담임
	private int lecture_idx;			//강의
	private String department_class;	//강의장
	
	private String instructor_name;		//강사이름

	
	public String getInstructor_name() {
		return instructor_name;
	}
	public void setInstructor_name(String instructor_name) {
		this.instructor_name = instructor_name;
	}
	public int getLecture_idx() {
		return lecture_idx;
	}
	public void setLecture_idx(int lecture_idx) {
		this.lecture_idx = lecture_idx;
	}
	public String getDepartment_class() {
		return department_class;
	}
	public void setDepartment_class(String department_class) {
		this.department_class = department_class;
	}
	public int getDepartment_idx() {
		return department_idx;
	}
	public void setDepartment_idx(int department_idx) {
		this.department_idx = department_idx;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public Date getDepartment_date() {
		return department_date;
	}
	public void setDepartment_date(Date department_date) {
		this.department_date = department_date;
	}
	public String getDepartment_status() {
		return department_status;
	}
	public void setDepartment_status(String department_status) {
		this.department_status = department_status;
	}
	public int getInstructor_idx() {
		return instructor_idx;
	}
	public void setInstructor_idx(int instructor_idx) {
		this.instructor_idx = instructor_idx;
	}
	public int getMentor_idx() {
		return mentor_idx;
	}
	public void setMentor_idx(int mentor_idx) {
		this.mentor_idx = mentor_idx;
	}
	
	
}