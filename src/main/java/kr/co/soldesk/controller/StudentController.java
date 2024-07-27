package kr.co.soldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import kr.co.soldesk.beans.Department;
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
		/*
		System.out.println(student.getName());
		studentService.addStudent(student);
		*/
		return "redirect:main";
	}
	
	
	@GetMapping("/information")
	private String information(@RequestParam("std")int studentIdx, Model model) {
		
		System.out.println(studentIdx + "번, 학생 소개 페이지");
		Student std = studentService.infoStudent(studentIdx);
		model.addAttribute("std", std);
		
		return "Student/InformationPage";
	}
	
	@GetMapping("/list")
	private String list(Model model) {
		
		List<Department> departmentlist = studentService.listDepartment();
		model.addAttribute("departList", departmentlist);	
		/*
		List<Student> studentList = studentService.listStudent();
		model.addAttribute("stdList", studentList);	
		
		for(Department depart : departmentlist) {
			System.out.println(depart.getDepartment_name());
		}*/
		
        List<Student> studentList = studentService.listStudent();
        Gson gson = new Gson();
        String studentListJson = gson.toJson(studentList);
        model.addAttribute("stdListJson", studentListJson);
        
        
		return "Student/ListPage";
	}
}
