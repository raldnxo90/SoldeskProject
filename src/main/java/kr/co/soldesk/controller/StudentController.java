package kr.co.soldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
import kr.co.soldesk.service.DepartmentService;
import kr.co.soldesk.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private DepartmentService departmentService;

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
		
		

		System.out.println(studentIdx + "번, 학생 상세 페이지");
		Student std = studentService.infoStudent(studentIdx);
		
		String departmentName = departmentService.nameDepartment(std.getDepartment_idx());
		
		model.addAttribute("std", std);
		model.addAttribute("departmentName", departmentName);
		
		return "Student/InformationPage";
	}
	
	@GetMapping("/modify")
	private String modify(@RequestParam("std") int studentIdx, Model model) {
		
		System.out.println(studentIdx + "번 학생 수정 페이지");
		Student modifyStudent = studentService.infoStudent(studentIdx);
		model.addAttribute("modifyStudent", modifyStudent);
		
		return "Student/ModifyPage";
	}
	
	@PostMapping("/modify_pro")
	private String modify_pro(@ModelAttribute("modifyStudent") Student modifyStudent) {
		
		System.out.println(modifyStudent.getStudent_status());
		System.out.println(modifyStudent.getStudent_email());
		System.out.println(modifyStudent.getStudent_phone());
		System.out.println(modifyStudent.getStudent_team());
		System.out.println(modifyStudent.getStudent_position());
		
		studentService.modifyStudent(modifyStudent);
		
		return "Student/Modify_successPage";
		
	}
	
	@GetMapping("/list")
	private String list(Model model) {
		
		List<Department> departmentlist = departmentService.listDepartment();
		model.addAttribute("departList", departmentlist);	

        List<Student> studentList = studentService.listStudent();
        Gson gson = new Gson();
        String studentListJson = gson.toJson(studentList);
        model.addAttribute("stdListJson", studentListJson);
        
        
		return "Student/ListPage";
	}
}
