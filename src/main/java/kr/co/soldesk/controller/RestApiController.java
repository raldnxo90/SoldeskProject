package kr.co.soldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RestController;

import kr.co.soldesk.beans.Instructor;
import kr.co.soldesk.dao.InstructorDAO;

@RestController
public class RestApiController {

	@Autowired
	private InstructorDAO instructorDAO;
	
}
