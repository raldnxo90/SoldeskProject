package kr.co.soldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.soldesk.beans.Department;
import kr.co.soldesk.beans.Student;

public interface StudentMapper {
	
    @Insert("INSERT INTO student (student_idx, student_name, student_gender, student_birth, student_email, student_phone, student_education, student_major) "
            + "VALUES (std_seq.nextval, "
            + "#{student_name}, "
            + "#{student_gender}, " 
            + "#{student_birth}, "
            + "#{student_email}, "
            + "#{student_phone}, " 
            + "#{student_education}"
            + "#{student_major}")
    void addStudent(Student studentBean);
    /*
    //모든 학생 출력
    @Select("select (student_name, student_team, student_)")
    List<Student> listStudent();
    */
    /*
    //과정목록
    @Select("select department_idx, department_name, department_date, department_status from department")
    List<Department> listDepartment();
    */
    //학생목록
    @Select("select * from student")
    List<Student> listStudent();
    
    //학생 상세페이지
    @Select("select * from student where student_idx = #{student_idx}")
    Student infoStudent(int student_idx);
    
    //학생 수정페이지
    @Update("UPDATE student SET "
            + "student_status = #{student_status}, "
            + "student_email = #{student_email}, "
            + "student_phone = #{student_phone}, "
            + "student_team = #{student_team}, "
            + "student_position = #{student_position} "
            + "WHERE student_idx = #{student_idx}")
    void modifyStudent(Student modifyStudent);
}
