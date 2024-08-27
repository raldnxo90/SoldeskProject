package kr.co.soldesk.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.soldesk.beans.Student;
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
			
			return "User/login_success";
			
		}else {
			
			return "User/login_fail";
		}
			
	}
	@GetMapping("/logout")
	private String logout() {
		
		return "User/logout";
	}
	@GetMapping("/join")
	private String join(@ModelAttribute("joinUserBean") Student joinUserBean) {
		
		
		return "User/join";
	}
	@PostMapping("/join_pro")
	private String join_pro(@Valid @ModelAttribute("joinUserBean") Student joinUserBean, BindingResult result) {
		
		if(result.hasErrors()) {
			
			return "User/join";
		}
		
		userService.joinStudent(joinUserBean);
		
		System.out.println(joinUserBean.getStudent_idx());
		System.out.println(joinUserBean.getStudent_id());
		System.out.println(joinUserBean.getStudent_pass());
		System.out.println(joinUserBean.isCheck_email());
		
		return "User/join_success";
	}
	
	@ResponseBody
	@GetMapping("/confirmStudent")
	private int confirmStudent(@RequestParam("email") String email) {
		
		return userService.confirmStudent(email);
	}
}
