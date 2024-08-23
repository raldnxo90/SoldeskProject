package kr.co.soldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.soldesk.beans.Department;
import kr.co.soldesk.mapper.DepartmentMapper;

@Repository
public class DepartmentDAO {

	@Autowired
	DepartmentMapper departmentMapper;
	
	public List<Department> listDepartment() {
		
		return departmentMapper.listDepartment();
	}
	
	public String nameDepartment(int department_idx) {
		
		return departmentMapper.nameDepartment(department_idx);
	}
	
	public void setDepartment(Department registerDepartment) {
		
		departmentMapper.setDepartment(registerDepartment);
	}
	
	public List<Department> getListDepartment(){
		
		return departmentMapper.getlistDepartment();
	}
	
}
