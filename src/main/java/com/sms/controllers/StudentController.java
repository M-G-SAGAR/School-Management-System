package com.sms.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sms.entities.Student;
import com.sms.helper.Message;
import com.sms.servicess.StudentService;

@Controller
@RequestMapping("/user")
public class StudentController {
	
	@Autowired
	private StudentService studentService;

	//Handler For Add Student
	@GetMapping("/add-student")
	public String addStudent(Model model) {
		model.addAttribute("student", new Student());
		return "user/add_student";
	}
	
	
	//Handler For Processing Add Student Form
	@PostMapping("/create-student")
	public String createBook(@ModelAttribute("student") Student student, Principal principal, HttpSession session) throws Exception {
		
		try {
			String name = principal.getName();
			this.studentService.createStudent(student);
			
			System.out.println(student);
			session.setAttribute("message", new Message("Successfully Added Student !!", "alert-success"));
			
			
			return "user/add_student";
		} catch (Exception e) {
			session.setAttribute("message", new Message("Something Went Wrong !!", "alert-danger"));
			e.printStackTrace();
			return "user/add_student";
		}
    
	}
	
	@GetMapping("/show-students")
	public String showStudents(Model model) {
		model.addAttribute("title", "List Of Students");
		
		List<Student> students = this.studentService.getAllStudents();
		model.addAttribute("students", students); 
		
		for(Student s : students) {
			
			System.out.println(s);
		}
		
		return "user/show_student";
	}
	
	@GetMapping("/student/{id}/show")
	public String showStudent(@PathVariable("id") long id, Model model) {
		Student student = studentService.getStudentById(id);
		model.addAttribute("student", student);
		return "user/show_student_by_Id";
	}
}
