package kr.co.soldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.soldesk.beans.Student;
import kr.co.soldesk.beans.User;
import kr.co.soldesk.mapper.UserMapper;

@Repository
public class UserDAO {

	@Autowired
	private UserMapper userMapper;
	
	public User getUserInfo(User loginUserBean) {
		
		return userMapper.getUserBean(loginUserBean);
	}
	
	public Student confirmStudent(String user_email) {
		
		return userMapper.confirmStudent(user_email);
	}
	
	public void joinStudent(Student joinUserBean) {
		
		userMapper.joinStudent(joinUserBean);
	}
}
