package kr.co.soldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.soldesk.beans.Instructor;
import kr.co.soldesk.dao.InstructorDAO;

@Service
public class InstructorService {

	@Autowired
	private InstructorDAO instructorDAO;
	
	public List<Instructor> getInstrudctorList(){
		
		return instructorDAO.getInstrudctorList();
	}
}
