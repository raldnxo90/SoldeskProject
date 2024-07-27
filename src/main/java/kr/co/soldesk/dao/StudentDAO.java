package kr.co.soldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.soldesk.beans.Department;
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
	/*
	//과정목록
	public List<Department> listDepartment() {
		
		return studentMapper.listDepartment();
	}*/
	//학생목록
	public List<Student> listStudent(){
		
		return studentMapper.listStudent();
	}
	//학생상세
	public Student infoStudent(int student_idx) {
		
		return studentMapper.infoStudent(student_idx);
		
	}
	//학생수정
	public void modifyStudent(Student modifyStudent) {
		
		studentMapper.modifyStudent(modifyStudent);
		System.out.println("DAO");
		System.out.println(modifyStudent.getStudent_idx());
		System.out.println(modifyStudent.getStudent_position());
		System.out.println(modifyStudent.getStudent_status());
		System.out.println("-------------------------------");
	}
	
}
