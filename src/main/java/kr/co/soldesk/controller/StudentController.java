package kr.co.soldesk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.soldesk.beans.Student;
import kr.co.soldesk.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;

	@GetMapping("/register")
	private String register(@ModelAttribute Student student) {
		
		System.out.println("학생 등록 페이지");
			
		return "Student/RegisterPage";
	}
	@PostMapping("/register_pro")
	private String register_pro(@ModelAttribute Student student) {
		
		System.out.println(student.getName());
		studentService.addStudent(student);
		
		return "redirect:main";
	}
	
	
	@GetMapping("/information")
	private String information() {
		
		System.out.println("학생 소개 페이지");
		
		return "Student/InformationPage";
	}
	
	@GetMapping("/list")
	private String list() {
		
		System.out.println("학생 관리 페이지");
		
		return "Student/ListPage";
	}
}
