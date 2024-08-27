package kr.co.soldesk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.soldesk.beans.User;

public class AdminInterceptor implements HandlerInterceptor{

	private User loginUserBean;
	
	public AdminInterceptor(User loginUserBean) {
		
		this.loginUserBean = loginUserBean;	
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		if(loginUserBean == null || loginUserBean.getUser_id()==null || !loginUserBean.getUser_id().equals("admin")) {
			
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath+"/admin/not_admin");
			return false;
		}
		
		return true;
	}
	
	
}