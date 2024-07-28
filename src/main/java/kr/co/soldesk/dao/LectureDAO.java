package kr.co.soldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.soldesk.beans.Lecture;
import kr.co.soldesk.mapper.LectureMapper;

@Repository
public class LectureDAO {

	@Autowired
	private LectureMapper lectureMapper;
	
	//강의 리스트
	public List<Lecture> getLectureList(){
		
		return lectureMapper.getLectureList();
	}
}
