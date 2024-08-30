package kr.co.soldesk.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.soldesk.beans.Student;
import kr.co.soldesk.beans.User;

public interface UserMapper {

	@Select("select user_id, user_name "
			+ "from userView "
			+ "where user_id = #{user_id} and user_pass = #{user_pass}")
	User getUserBean(User loginUserBean);
	
	//학생 조회
	@Select("select student_idx, student_id "
			+ "from student "
			+ "where student_email = #{user_email}")
	Student confirmStudent(String user_email);
	
	//학생 가입
	@Update("update student "
			+ "set student_id = #{student_id}, student_pass = #{student_pass} "
			+ "where student_idx = #{student_idx}")
	void joinStudent(Student joinUserBean);
}
