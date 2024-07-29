package kr.co.soldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import kr.co.soldesk.beans.Department;
import kr.co.soldesk.beans.Instructor;
import kr.co.soldesk.beans.Lecture;
import kr.co.soldesk.beans.Student;
import kr.co.soldesk.service.DepartmentService;
import kr.co.soldesk.service.InstructorService;
import kr.co.soldesk.service.LectureService;
import kr.co.soldesk.service.StudentService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private InstructorService instructorService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private LectureService lectureService;
	
	Gson gson = new Gson();
	
	@GetMapping("/main")
	public String adminMain() {
		
		return "admin/MainPage";
	}

	@GetMapping("/department/register")
	public String departmentRegister(@ModelAttribute("registerDepartment") Department registerDepartment, Model model) {
		
	    List<Instructor> instructors = instructorService.getInstrudctorList();
	    List<Lecture> lectures = lectureService.getLectureList();
	    
	    model.addAttribute("instructors", instructors);
	    model.addAttribute("lectures", lectures);
	    
	    String instructorListJson = gson.toJson(instructors);
	    model.addAttribute("instructorListJson", instructorListJson);
	    
	    String lectureJson = gson.toJson(lectures);
	    model.addAttribute("lectureJson", lectureJson);
	    
	    return "admin/Department/RegisterPage";
	}
	
	@PostMapping("/department/register_pro")
	public String departmentRegister_pro(@ModelAttribute("registerDepartment") Department registerDepartment) {
		
		departmentService.setDepartment(registerDepartment);
		
		return "admin/Department/Register_Success";
	}
	
	@GetMapping("/student/register")
	public String studentRegister(@ModelAttribute("registerStudent") Student registerStudent, Model model) {
		
		List<Department> departments = departmentService.listDepartment();
		
		model.addAttribute("departments", departments);
		
		return "admin/Student/RegisterPage";
	}
	
	@PostMapping("/student/register_pro")
	public String studentRegister_pro(@ModelAttribute("registerStudent") Student registerStudent) {
		
		studentService.addStudent(registerStudent);
		
		return "admin/Student/Register_Success";
	}
	
}
