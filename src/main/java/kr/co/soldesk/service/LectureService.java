package kr.co.soldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.soldesk.beans.Lecture;
import kr.co.soldesk.dao.LectureDAO;

@Service
public class LectureService {

	@Autowired
	private LectureDAO lectureDAO;
	
	//강의 리스트
	public List<Lecture> getLectureList(){
		
		return lectureDAO.getLectureList();
	}
}
