package kr.co.soldesk.beans;

public class User {

	private String user_id;
	private String user_pass;
	private String user_name;
	private boolean user_login;
	
	public User() {
		this.user_login = false;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pass() {
		return user_pass;
	}

	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}

	public boolean isUser_login() {
		return user_login;
	}

	public void setUser_login(boolean user_login) {
		this.user_login = user_login;
	}
	
}