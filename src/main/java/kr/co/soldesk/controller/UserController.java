package kr.co.soldesk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.soldesk.beans.User;
import kr.co.soldesk.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;

	@GetMapping("/login")
	private String login(@ModelAttribute("tempLoginUserBean") User tempLoginUserBean,
						 @RequestParam(defaultValue = "true") boolean status,
						 Model model) {
		
		System.out.println(status);
		model.addAttribute("status", status);
		
		return "User/login";
	}
	@PostMapping("/login_pro")
	private String login_pro(@ModelAttribute("tempLoginUserBean") User tempLoginUserBean) {
		
		System.out.println(tempLoginUserBean.getUser_id());
		System.out.println(tempLoginUserBean.getUser_pass());
		
		if(userService.getUserInfo(tempLoginUserBean)) {
			
			return "redirect:main";
			
		}else {
			
			return "User/login_fail";
		}
		
		
	}
	
}
