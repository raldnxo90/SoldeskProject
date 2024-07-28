package kr.co.soldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.soldesk.beans.Lecture;

public interface LectureMapper {

	//강의 리스트
	@Select("select * from lecture")
	List<Lecture> getLectureList();
}
