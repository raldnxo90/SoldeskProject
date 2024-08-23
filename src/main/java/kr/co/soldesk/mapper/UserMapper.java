package kr.co.soldesk.mapper;

import org.apache.ibatis.annotations.Select;

import kr.co.soldesk.beans.User;

public interface UserMapper {

	@Select("select user_id, user_name "
			+ "from userView "
			+ "where user_id = #{user_id} and user_pass = #{user_pass}")
	User getUserBean(User loginUserBean);
}
