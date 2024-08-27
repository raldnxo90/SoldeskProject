package kr.co.soldesk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.soldesk.beans.User;

public class TopInterceptor implements HandlerInterceptor{

	private User loginUserBean;
	
	public TopInterceptor(User loginUserBean) {
		
		this.loginUserBean = loginUserBean;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		request.setAttribute("loginUserBean", loginUserBean);
		
		return true;
	}
	
}
