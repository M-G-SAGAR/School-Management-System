package com.sms.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sms.entities.Teacher;
import com.sms.entities.User;
import com.sms.helper.Message;
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
	public String processAddTeacher(@ModelAttribute("teacher") Teacher teacher, Model model, HttpSession session) {
		
		try {
			teacherRepository.save(teacher);
			session.setAttribute("message", new Message("Successfully Added Teacher !!", "alert-success"));
			return "user/add_teacher";

		} catch (Exception e) {
			session.setAttribute("message", new Message("Successfully Added Teacher !!", "alert-success"));
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
	
}
