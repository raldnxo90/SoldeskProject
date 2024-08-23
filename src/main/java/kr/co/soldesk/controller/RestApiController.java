package kr.co.soldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import kr.co.soldesk.beans.Instructor;
import kr.co.soldesk.dao.InstructorDAO;

@RestController
public class RestApiController {

	@Autowired
	private InstructorDAO instructorDAO;
	
	private Gson gson;
	
	@GetMapping("instructor/showInstuctorList")
	public String showInstructorList(@RequestParam String instructor_sort){
		
		List<Instructor> instructorList = instructorDAO.getInstrudctorList();
		
		return "";
		
	}
	
}
