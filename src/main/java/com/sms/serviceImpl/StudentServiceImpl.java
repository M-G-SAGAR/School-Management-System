package com.sms.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sms.entities.Student;
import com.sms.repository.StudentRepository;
import com.sms.servicess.StudentService;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentRepository studentRepository;

	@Override
	public List<Student> getAllStudents() {

		return studentRepository.findAll();
	}

	@Override
	public Student getStudentById(long id) {
		return studentRepository.findById((long) id).orElse(null);
	}

	@Override
	public Student createStudent(Student student) {

		return studentRepository.save(student);
	}

	@Override
	public Student updateStudent(long id, Student student) {
		if (studentRepository.existsById((long) id)) {

			student.setId(id);

			studentRepository.save(student);
		}
		return null;
	}

	@Override
	public void deleteStudent(long id) {

		studentRepository.deleteById(id);
	}

}
