package kr.co.soldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.soldesk.beans.Student;
import kr.co.soldesk.mapper.StudentMapper;

@Repository
public class StudentDAO {

	@Autowired
	private StudentMapper studentMapper;
	
	//학생등록
	public void addStudent(Student studentBean) {
		
		studentMapper.addStudent(studentBean);
	}
}
