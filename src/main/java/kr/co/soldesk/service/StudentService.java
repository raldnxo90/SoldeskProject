package kr.co.soldesk.service;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.soldesk.beans.Student;
import kr.co.soldesk.dao.StudentDAO;

@Service
public class StudentService {
	
	@Autowired
	private StudentDAO studentDAO;
	
	public void addStudent(Student studentBean) {
		/*
		String birthdateString = studentBean.getBirth();
		Date birthdate = null;
		
        try {
            birthdate = (Date) new SimpleDateFormat("yyyy-MM-dd").parse(birthdateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }
		*/
		studentDAO.addStudent(studentBean);
	}

}
