package kr.co.soldesk.mapper;

import org.apache.ibatis.annotations.Insert;

import kr.co.soldesk.beans.Student;

public interface StudentMapper {
	
    @Insert("INSERT INTO student (idx, name, gender, birth, email, phone, department) " +
            "VALUES (std_seq.nextval, #{name, jdbcType=VARCHAR}, #{gender, jdbcType=VARCHAR}, " +
            "#{birth, jdbcType=DATE}, #{email, jdbcType=VARCHAR}, #{phone, jdbcType=VARCHAR}, " +
            "#{department, jdbcType=VARCHAR})")
    void addStudent(Student studentBean);

}
