package kr.co.soldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.soldesk.beans.User;
import kr.co.soldesk.mapper.UserMapper;

@Repository
public class UserDAO {

	@Autowired
	private UserMapper userMapper;
	
	public User getUserInfo(User loginUserBean) {
		
		return userMapper.getUserBean(loginUserBean);
	}
	
}
