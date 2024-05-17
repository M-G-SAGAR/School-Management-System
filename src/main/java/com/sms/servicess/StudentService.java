package com.sms.servicess;

import java.util.List;

import com.sms.entities.Student;

public interface StudentService {

	public List<Student> getAllStudents();

	public Student getStudentById(long id);

	public Student createStudent(Student student);

	public Student updateStudent(long id, Student student);

	public void deleteStudent(long id);
}
