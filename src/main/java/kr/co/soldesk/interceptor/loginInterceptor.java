package kr.co.soldesk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.soldesk.beans.User;

public class loginInterceptor implements HandlerInterceptor{

	private User loginUserBean;
	
	public loginInterceptor(User loginUserBean) {
		this.loginUserBean = loginUserBean;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if(loginUserBean.isUser_login()==false) {
			
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath+"/user/not_login");
			return false;
		}
		
		return true;
	}
	
	
}
