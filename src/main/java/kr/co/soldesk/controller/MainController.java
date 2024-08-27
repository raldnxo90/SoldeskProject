package kr.co.soldesk.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.soldesk.beans.User;

@Controller
public class MainController {

	@Resource(name = "loginUserBean")
	private User loginUserBean;
	
	@GetMapping("/main")
	private String main(Model model) {
		
		System.out.println("메인 페이지");
		//loginUserBean.setUser_login(true);//임시 로그인 허용
		model.addAttribute("loginUserBean", loginUserBean);
		
		return "/MainPage";
	}
}
