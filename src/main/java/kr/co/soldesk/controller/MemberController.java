package kr.co.soldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

	@GetMapping("/member/register")
	private String register() {
		
		System.out.println("학생 등록 페이지");
		
		return "Member/RegisterPage";
	}
	
	@GetMapping("/member/information")
	private String information() {
		
		System.out.println("학생 소개 페이지");
		
		return "Member/InformationPage";
	}
	
	@GetMapping("/member/list")
	private String list() {
		
		System.out.println("학생 관리 페이지");
		
		return "Member/ListPage";
	}
}
