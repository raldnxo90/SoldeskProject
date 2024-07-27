package kr.co.soldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.soldesk.beans.Instructor;

public interface InstructorMapper {
	
	@Select("select instructor_idx, instructor_name from instructor")
	List<Instructor>getInstrudctorList();

}
