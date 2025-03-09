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

import com.sms.entities.Fees;
import com.sms.entities.Student;
import com.sms.entities.User;
import com.sms.helper.Message;
import com.sms.repository.FeesRepository;
import com.sms.repository.StudentRepository;
import com.sms.repository.UserRepository;
import com.sms.serviceImpl.FeesServiceImpl;

@Controller
@RequestMapping("/user")
public class StudentController {
	
	@Autowired
	private StudentRepository studentRepository;
	
	private FeesServiceImpl feesServiceImpl;
	
	@Autowired
	private FeesRepository feesRepository;
	
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
			@RequestParam("profileImage") MultipartFile file,
			@RequestParam("parentsPhoto") MultipartFile file1,
			Principal principal, HttpSession session) throws Exception {
		
		try {
			//processing and uploading file
			if(file.isEmpty()) {
				//if the file is empty then try our message
				System.out.println("FIle Not Uploaded.....");
				student.setImage("student.png");
				student.setParentImage("student.png");
			}else {
				//file to folder and update the name to student
				student.setImage(file.getOriginalFilename());
				student.setParentImage(file1.getOriginalFilename());
				
				File saveFile = new ClassPathResource("static/img").getFile();
				Path path = Paths.get(saveFile.getAbsolutePath()+File.separator+file.getOriginalFilename());
				Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
				
				File saveFile1 = new ClassPathResource("static/img").getFile();
				Path path1 = Paths.get(saveFile1.getAbsolutePath()+File.separator+file1.getOriginalFilename());
				Files.copy(file1.getInputStream(), path1, StandardCopyOption.REPLACE_EXISTING);
				
				System.out.println("Image Uploaded.....");
			}
		
			studentRepository.save(student);
			
			
			/*
			 * try { // ✅ Automatically save student details in the fees table Fees fees =
			 * new Fees(); fees.setStudentId(student.getId());
			 * fees.setStudentName(student.getFirstName() + " " + student.getLastName());
			 * fees.setTotalFees(10000.0); // Default total fees fees.setPaidFees(0.0);
			 * fees.setDueFees(10000.0); // Initially, due amount is total fees
			 * 
			 * feesRepository.save(fees); // Save fees entry
			 * 
			 * } catch (Exception e) { e.printStackTrace(); }
			 */

	        
			
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
	
	//Handler to fetch students or show all students
		@GetMapping("/show-parents")
		public String showParents(Model model) {
			model.addAttribute("title", "List Of Parents");
			
			List<Student> students = this.studentRepository.findAll();
			model.addAttribute("students", students); 
			
			for(Student s : students) {
				
				System.out.println(s);
			}
			return "user/parent_details";
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
	@PostMapping("/student/{id}/delete")
	public String deleteStudent(@PathVariable("id") long id, HttpSession session) {
	    if (studentRepository.existsById(id)) {
	        studentRepository.deleteById(id);
	        session.setAttribute("message", new Message("Student deleted successfully!", "alert-success"));
	    } else {
	        session.setAttribute("message", new Message("Student not found!", "alert-danger"));
	    }
	    return "redirect:/user/show-students";
	}

	
	//Handler to update page to send blank object fill the field to modify
	@GetMapping("/student/{id}/edit")
	public String updateStudentForm(@PathVariable("id") long id, Model model) {
		
		Student student = studentRepository.findById(id).get();
		model.addAttribute("student",student);
		return "user/update_student";
	}
	
	//Handler to Modify Object with provided details
	@PostMapping("/student-update/{id}")
	public String updateStudentHandler(
	        @PathVariable("id") long id,
	        @ModelAttribute("student") Student student,
	        @RequestParam("profileImage") MultipartFile studentImage,
	        @RequestParam("parentsPhoto") MultipartFile parentImage,  // Ensure name matches form
	        HttpSession session) {

	    try {
	        Student studentOld = studentRepository.findById(id).orElseThrow();

	        // Handle Student Image
	        if (!studentImage.isEmpty()) {
	            // Get the folder where images are stored
	            File saveFile = new ClassPathResource("static/img").getFile();

	            // Delete old image
	            File oldFile = new File(saveFile, studentOld.getImage());
	            if (oldFile.exists()) {
	                oldFile.delete();
	                System.out.println("Old Student Image Deleted: " + oldFile.getAbsolutePath());
	            }

	            // Save new image
	            Path studentPath = Paths.get(saveFile.getAbsolutePath(), studentImage.getOriginalFilename());
	            Files.copy(studentImage.getInputStream(), studentPath, StandardCopyOption.REPLACE_EXISTING);
	            System.out.println("New Student Image Saved: " + studentPath.toString());

	            student.setImage(studentImage.getOriginalFilename());
	        } else {
	            student.setImage(studentOld.getImage()); // Keep old image if no new file is uploaded
	        }

	        // Handle Parent Image
	        if (!parentImage.isEmpty()) {
	            File saveFile = new ClassPathResource("static/img").getFile();

	            // Delete old parent image
	            File oldParentFile = new File(saveFile, studentOld.getParentImage());
	            if (oldParentFile.exists()) {
	                oldParentFile.delete();
	                System.out.println("Old Parent Image Deleted: " + oldParentFile.getAbsolutePath());
	            }

	            // Save new parent image
	            Path parentPath = Paths.get(saveFile.getAbsolutePath(), parentImage.getOriginalFilename());
	            Files.copy(parentImage.getInputStream(), parentPath, StandardCopyOption.REPLACE_EXISTING);
	            System.out.println("New Parent Image Saved: " + parentPath.toString());

	            student.setParentImage(parentImage.getOriginalFilename());
	        } else {
	            student.setParentImage(studentOld.getParentImage()); // Keep old parent image
	        }

	        student.setId(id);
	        studentRepository.save(student);
	        session.setAttribute("message", new Message("Successfully Updated Student!", "alert-success"));

	    } catch (Exception e) {
	        e.printStackTrace(); // Print full error details in console
	        session.setAttribute("message", new Message("Something Went Wrong!", "alert-danger"));
	    }

	    return "redirect:/user/student/" + student.getId() + "/edit";
	}


	
}
