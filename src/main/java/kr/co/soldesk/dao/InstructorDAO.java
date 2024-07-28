package kr.co.soldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.soldesk.beans.Instructor;
import kr.co.soldesk.mapper.InstructorMapper;

@Repository
public class InstructorDAO {
	
	@Autowired
	private InstructorMapper instructorMapper;
	
	public List<Instructor> getInstrudctorList(){
		
		return instructorMapper.getInstrudctorList();
	}
	
	public String getInstructorName(int instructor_idx) {
		
		return instructorMapper.getInstructorName(instructor_idx);
	}

}
