package kr.co.soldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.soldesk.beans.Department;
import kr.co.soldesk.dao.DepartmentDAO;
import kr.co.soldesk.dao.InstructorDAO;

@Service
public class DepartmentService {

	@Autowired
	private DepartmentDAO departmentDAO;
	
	@Autowired
	private InstructorDAO instructorDAO;
	
	public List<Department> listDepartment() {
		
		return departmentDAO.listDepartment();
	}
	
	public String nameDepartment(int department_idx) {
		
		return departmentDAO.nameDepartment(department_idx);
	}
	
	public void setDepartment(Department registerDepartment) {
		
		String departName = departmentDAO.nameDepartment(registerDepartment.getDepartment_idx());
		String className = registerDepartment.getDepartment_class();
		String instructorName = instructorDAO.getInstructorName(registerDepartment.getInstructor_idx());
		
		String metorName = instructorDAO.getInstructorName(registerDepartment.getInstructor_idx());//직원테이블 추가 시 변경
		String period = 13 + "회차";//강의테이블에 회차 추가 시 변경
		
		String departmentName = departName + " " + className + " "+ period + " " + instructorName + "(" + metorName + ")";
		System.out.println(departmentName);
		registerDepartment.setDepartment_name(departmentName);
		
		departmentDAO.setDepartment(registerDepartment);
	}
}
