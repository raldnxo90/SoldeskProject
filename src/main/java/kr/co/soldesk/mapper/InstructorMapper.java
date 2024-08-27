package kr.co.soldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.soldesk.beans.Instructor;

public interface InstructorMapper {
	
	//강사 리스트
	@Select("select instructor_idx, instructor_name, instructor_sort from instructor")
	List<Instructor>getInstrudctorList();
	
	//강사 이름
	@Select("select instructor_name from instructor where instructor_idx = #{instructor_idx}")
	String getInstructorName(int instructor_idx);

}
