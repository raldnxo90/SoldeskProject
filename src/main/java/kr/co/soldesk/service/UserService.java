package kr.co.soldesk.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
