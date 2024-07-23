package kr.co.soldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/main")
	private String main() {
		
		System.out.println("메인 페이지");
		
		return "/MainPage";
	}
}
