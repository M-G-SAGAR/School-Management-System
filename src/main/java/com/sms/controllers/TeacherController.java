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
import com.sms.entities.Teacher;
import com.sms.entities.User;
import com.sms.helper.Message;
import com.sms.repository.StudentRepository;
import com.sms.repository.TeacherRepository;
import com.sms.repository.UserRepository;

@Controller
@RequestMapping("/user")
public class TeacherController {
	
	@Autowired
	private TeacherRepository teacherRepository;
	
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

	//Handler for Open Teacher Add Form 
	@GetMapping("/add-teacher")
	public String openAddTeacher(Model model) {
		
		model.addAttribute("teacher", new Teacher());
		return "user/add_teacher";
	}
	
	//Handler for process the Teacher form
	@PostMapping("create-teacher")
	public String processAddTeacher(
			@ModelAttribute("teacher") Teacher teacher,
			@RequestParam("teacherPhoto") MultipartFile file,
			Model model, HttpSession session) {
		
		try {
			
			try {
				//processing and uploading file
				if(file.isEmpty()) {
					//if the file is empty then try our message
					System.out.println("FIle Not Uploaded.....");
					teacher.setImage("student.png");
				}else {
					//file to folder and update the name to student
					teacher.setImage(file.getOriginalFilename());
					
					File saveFile = new ClassPathResource("static/img").getFile();
					Path path = Paths.get(saveFile.getAbsolutePath()+File.separator+file.getOriginalFilename());
					Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
					
					System.out.println("Image Uploaded.....");
				}
				} catch(Exception e) {
					System.out.println("Teacher Image Not Uploaded.....");
				}
			
			
			teacherRepository.save(teacher);
			session.setAttribute("message", new Message("Successfully Added Teacher !!", "alert-success"));
			return "user/add_teacher";

		} catch (Exception e) {
			session.setAttribute("message", new Message("Somethings Went Wrong Teacher Not Added !!", "alert-success"));
			return "user/add_teacher";
		}
	}
	
	//Handler for show or fetch all teachers 
	@GetMapping("/show-teachers")
	public String showTeachers(Model model) {
		List<Teacher> teachers = this.teacherRepository.findAll();
		
		model.addAttribute("teachers",teachers);
		return "user/show_teachers";
	}
	
	@GetMapping("/teacher/{id}/show")
	public String showTeacher(@PathVariable("id") long id, Model model) {
	    Teacher teacher = teacherRepository.findById(id);
	   
	        model.addAttribute("teacher", teacher);
	        return "user/teacher_details";  // Correct view name
	}

	//Handler to delete student by ID
	@PostMapping("/teacher/{id}/delete")
	public String deleteTeacher(@PathVariable("id") long id) {
	    teacherRepository.deleteById(id);
	    return "redirect:/user/show-teachers";
	}
	
	//Handler to update page to send blank object fill the field to modify
	@GetMapping("/teacher/{id}/edit")
	public String updateTeacherForm(@PathVariable("id") long id, Model model) {
		
		Teacher teacher = teacherRepository.findById(id);
		model.addAttribute("teacher",teacher);
		return "user/update_teacher";
	}
	
	//Handler to update page to send blank object fill the field to modify
	@PostMapping("/teacher-update/{id}")
	public String updateTeacherHandler(
			@PathVariable("id") long id,
			@ModelAttribute("teacher") Teacher teacher,
			@RequestParam("teacherImage") MultipartFile file,
			HttpSession session) {
		
		try {
			Teacher teacherOld = teacherRepository.findById(id);
			
			if(!file.isEmpty()) {
				// Get the folder where images are stored
				File saveFile = new ClassPathResource("static/img").getFile();
				
				// Delete old image
				File oldFile = new File(saveFile, teacherOld.getImage());
				if(oldFile.exists()) {
					oldFile.delete();
					System.out.println("Old Teacher Image Deleted " + oldFile.getAbsolutePath());
				}
				
				//save the new Image
				Path teacherPath = Paths.get(saveFile.getAbsolutePath(), file.getOriginalFilename());
				Files.copy(file.getInputStream(), teacherPath, StandardCopyOption.REPLACE_EXISTING);
				System.out.println("New Student Image Saved: "+ teacherPath.toString());
				
				teacher.setImage(file.getOriginalFilename());
			}else {
				teacher.setImage(teacherOld.getImage());
			}
			
			teacher.setTid(id);
			teacherRepository.save(teacher);
			 session.setAttribute("message", new Message("Successfully Updated Teacher!", "alert-success"));

		} catch(Exception e){
			e.printStackTrace();
			 session.setAttribute("message", new Message("Something Went Wrong!", "alert-success"));

		}
		
		return "redirect:/user/teacher/" + teacher.getTid() + "/edit";
	}

}
