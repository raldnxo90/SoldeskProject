package kr.co.soldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.soldesk.beans.Department;
import kr.co.soldesk.dao.DepartmentDAO;

@Service
public class DepartmentService {

	@Autowired
	private DepartmentDAO departmentDAO;
	
	public List<Department> listDepartment() {
		
		return departmentDAO.listDepartment();
	}
	
	public String nameDepartment(int department_idx) {
		
		return departmentDAO.nameDepartment(department_idx);
	}
	
	public void setDepartment(Department registerDepartment) {
		
		//registerDepartment.setDepartment_status("개강 전");
		//System.out.println(registerDepartment.getDepartment_status());
		
		departmentDAO.setDepartment(registerDepartment);
	}
}
