package kr.co.soldesk.beans;

public class Lecture {
//강의
	private int lecture_idx;
	private String lecture_name;
	private String lecture_sort;
	
	public int getLecture_idx() {
		return lecture_idx;
	}
	public void setLecture_idx(int lecture_idx) {
		this.lecture_idx = lecture_idx;
	}
	public String getLecture_name() {
		return lecture_name;
	}
	public void setLecture_name(String lecture_name) {
		this.lecture_name = lecture_name;
	}
	public String getLecture_sort() {
		return lecture_sort;
	}
	public void setLecture_sort(String lecture_sort) {
		this.lecture_sort = lecture_sort;
	}
	
	
}
