package com.sms.controllers;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sms.entities.Student;
import com.sms.entities.User;
import com.sms.helper.Message;
import com.sms.repository.StudentRepository;
import com.sms.repository.UserRepository;

@Controller
@RequestMapping("/user")
public class StudentController {
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	//Data For All Common Page Like Title
	@ModelAttribute
	public void showUserAfterLogin(Model m, Principal p) {
		String userName = p.getName();
		System.out.println(userName);
		User user = userRepository.getUserByUserName(userName);
		System.out.println(user);
		m.addAttribute("user", user);
		
	}

	//Handler For Add Student
	@GetMapping("/add-student")
	public String addStudent(Model model) {
		model.addAttribute("student", new Student());
		return "user/add_student";
	}
	
	
	//Handler For Processing Add Student Form
	@PostMapping("/create-student")
	public String createBook(
			@ModelAttribute("student") Student student, 
			@RequestParam("profileImage") MultipartFile file,Principal principal, HttpSession session) throws Exception {
		
		try {
			//processing and uploading file
			if(file.isEmpty()) {
				//if the file is empty then try our message
				System.out.println("FIle Not Uploaded.....");
				student.setImage("student.png");
			}else {
				//file to folder and update the name to student
				student.setImage(file.getOriginalFilename());
				
				File saveFile = new ClassPathResource("static/img").getFile();
				Path path = Paths.get(saveFile.getAbsolutePath()+File.separator+file.getOriginalFilename());
				Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
				
				System.out.println("Image Uploaded.....");
			}
		
			studentRepository.save(student);
			
			session.setAttribute("message", new Message("Successfully Added Student !!", "alert-success"));
			return "user/add_student";
		} catch (Exception e) {
			session.setAttribute("message", new Message("Something Went Wrong !!", "alert-danger"));
			e.printStackTrace();
			return "user/add_student";
		}
    
	}
	
	//Handler to fetch students or show all students
	@GetMapping("/show-students")
	public String showStudents(Model model) {
		model.addAttribute("title", "List Of Students");
		
		List<Student> students = this.studentRepository.findAll();
		model.addAttribute("students", students); 
		
		for(Student s : students) {
			
			System.out.println(s);
		}
		
		return "user/show_student";
	}
	
	//Handler to show or fetch student by ID
	@GetMapping("/student/{id}/show")
	public String showStudent(@PathVariable("id") long id, Model model) {
		Student student = studentRepository.findById(id). 
			orElseThrow(() -> new IllegalArgumentException("Invalid Student ID: " + id));
		model.addAttribute("student", student);
		return "user/show_student_by_Id";
	}
	
	//Handler to delete student by ID
	@GetMapping("/student/{id}/delete")
	public String deleteStudent(@PathVariable("id") long id) {
		studentRepository.deleteById(id);
		return "redirect:/user/show-students";
	}
	
	//Handler to update page to send blank object fill the field to modify
	@PostMapping("/student/{id}/edit")
	public String editStudentForm(@PathVariable("id") long id, Model model) {
		
		Student student = studentRepository.findById(id).get();
		model.addAttribute("student",student);
		return "user/update_student";
	}
	
	//Handler to Modify Object with provided details
	@PostMapping("/student-update/{id}")
	public String updateStudent(@PathVariable("id") long id, @ModelAttribute("student") Student student, HttpSession session) {
		try {
			
			student.setId(id);
			System.out.println(student);
			studentRepository.save(student);
			session.setAttribute("message", new Message("Successfully Update Student !!", "alert-success"));
		
		} catch (Exception e) {
			System.out.println(student);
			session.setAttribute("message", new Message("Something Went Wrong !!", "alert-success"));
		
		}
		
		return "redirect:/user/student/"+student.getId()+"/edit";
	}
	
}
