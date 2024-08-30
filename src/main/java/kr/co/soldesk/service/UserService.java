package kr.co.soldesk.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.soldesk.beans.Student;
import kr.co.soldesk.beans.User;
import kr.co.soldesk.dao.UserDAO;

@Service
public class UserService {

	@Resource(name = "loginUserBean")
	private User loginUserBean;
	
	@Autowired
	private UserDAO userDAO;
	
	public boolean getUserInfo(User loginUserBean) {
		
		User tempUserBean = userDAO.getUserInfo(loginUserBean);
		if(tempUserBean != null) {
			
			this.loginUserBean.setUser_id(loginUserBean.getUser_id());
			this.loginUserBean.setUser_name(loginUserBean.getUser_name());
			this.loginUserBean.setUser_login(true);
			
			return true;
		}else {
			return false;
		}
	}
	
	public void joinStudent(Student joinUserBean) {
		
		userDAO.joinStudent(joinUserBean);
	}
	/*
	public Student confirmStudent(String user_email) {
		
		Student confirmStudent = new Student();
		confirmStudent = userDAO.confirmStudent(user_email);
		//System.out.println(confirmStudent.getStudent_id());
		
		if(confirmStudent.getStudent_id()!=null) {
			confirmStudent.setJoinCheck(false);
			return confirmStudent;
		}else {
			System.out.println("가입이 가능한 학생");
			confirmStudent.setJoinCheck(true);
			return confirmStudent;
		}
	}*/
	public Student confirmStudent(String user_email) {

	    Student confirmStudent = userDAO.confirmStudent(user_email);

	    if (confirmStudent == null || confirmStudent.getStudent_id() == null) {
	        // null이거나 이미 가입된 학생일 경우
	        if (confirmStudent == null) {
	            confirmStudent = new Student();
	        }
	        confirmStudent.setJoinCheck(true);
	        return confirmStudent;
	    } else {
	        // 가입이 가능한 학생일 경우
	        confirmStudent.setJoinCheck(false);
	        return confirmStudent;
	    }
	}
}


