package kr.co.soldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.soldesk.beans.Department;
import kr.co.soldesk.beans.Student;

public interface StudentMapper {
	
    @Insert("INSERT INTO student (idx, name, gender, birth, email, phone, department) " +
            "VALUES (std_seq.nextval, #{name, jdbcType=VARCHAR}, #{gender, jdbcType=VARCHAR}, " +
            "#{birth, jdbcType=DATE}, #{email, jdbcType=VARCHAR}, #{phone, jdbcType=VARCHAR}, " +
            "#{department, jdbcType=VARCHAR})")
    void addStudent(Student studentBean);
    /*
    //모든 학생 출력
    @Select("select (student_name, student_team, student_)")
    List<Student> listStudent();
    */
    
    //과정목록
    @Select("select department_idx, department_name, department_date, department_status from department")
    List<Department> listDepartment();
    
    //학생목록
    @Select("select * from student")
    List<Student> listStudent();
    
    //학생 상세페이지
    @Select("select * from student where student_idx = #{student_idx}")
    Student infoStudent(int student_idx);
}
