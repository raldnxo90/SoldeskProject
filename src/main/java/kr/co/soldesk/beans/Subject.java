package kr.co.soldesk.beans;

public class Subject {
//과목
	
	private int subject_idx;
	private String subject_name;
	private String subject_detail;
	
	private int lecture_id;

	public int getSubject_idx() {
		return subject_idx;
	}

	public void setSubject_idx(int subject_idx) {
		this.subject_idx = subject_idx;
	}

	public String getSubject_name() {
		return subject_name;
	}

	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}

	public String getSubject_detail() {
		return subject_detail;
	}

	public void setSubject_detail(String subject_detail) {
		this.subject_detail = subject_detail;
	}

	public int getLecture_id() {
		return lecture_id;
	}

	public void setLecture_id(int lecture_id) {
		this.lecture_id = lecture_id;
	}
	
	

}
