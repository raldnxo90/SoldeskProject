package kr.co.soldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.soldesk.beans.Department;

public interface DepartmentMapper {

	//과정 목록
    @Select("select department_idx, department_name, department_date, department_status from department")
    List<Department> listDepartment();
    
    //과정명
    @Select("select department_name from department where department_idx = #{department_idx}")
    String nameDepartment(int department_idx);
    
    //과정등록
    @Insert("insert into department (department_idx, department_name, department_date, instructor_idx, mentor_idx, lecture_idx, department_class) "
    		+ "values(depart_seq.nextval, #{department_name}, #{department_date}, #{instructor_idx}, #{mentor_idx}, #{lecture_idx}, #{department_class q})")
    void setDepartment(Department registerDepartment);
    
	//특정 분야별 과정, 강사 목록
    @Select("select d.department_idx, d.department_name, i.instructor_name "
    		+ "from department d, instructor i "
    		+ "where d.instructor_idx = i.insturctor_idx")
    List<Department> getlistDepartment();
    
}
