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

import com.sms.entities.Subject;
import com.sms.entities.User;
import com.sms.helper.Message;
import com.sms.repository.SubjectRepository;
import com.sms.repository.UserRepository;

@Controller
@RequestMapping("/user")
public class SubjectController {
	
	@Autowired
	private SubjectRepository subjectRepository;
	
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

	@GetMapping("/add-subject")
	public String createSubject() {
		return "user/add_subject";
	}
	
	//Handler for process the Teacher form
	@PostMapping("create-subject")
	public String processAddSubject(
			@ModelAttribute("subjects") Subject subject,
			Model model,
			HttpSession session) {
			  
		try {
			//save subject
			subjectRepository.save(subject);
			session.setAttribute("message", new Message("Successfully Added Subject !!", "alert-success")); 
			System.out.println(subject);
			return "user/add_subject";
		} catch (Exception e) {
			session.setAttribute("message", new Message("Something Went Wrong !!", "alert-danger")); 
			return "user/add_subject";
		}
	}
	
	//Handler for show subject table
	@GetMapping("/show-subject")
	public String showSubjects(Model model) {
		
		List<Subject> subjects = this.subjectRepository.findAll();
		model.addAttribute("subjects",subjects);
		return "user/show_subject";
	}
	
	//Handler to get subject by id
	@GetMapping("/subject/{id}/show")
	public String showSubject(@PathVariable("id") long id,
			Model model) {
		
		Subject subject = subjectRepository.findById(id).orElseThrow();
		model.addAttribute("subjects",subject);
		return "user/subject_details";
	}
	
	//Handler to delete student by id
	@PostMapping("/subject/{id}/delete")
	public String deleteSubject(@PathVariable("id") long id) {
		
		subjectRepository.deleteById(id);
		return "redirect:/user/show-subject";
	}
	
	//Handler to update page to send blank object fill the field to modify
	@GetMapping("/subject/{id}/edit")
	public String updateSubjectForm(@PathVariable("id") long id, Model model) {
		
		Subject subject = subjectRepository.findById(id).get();
		model.addAttribute("subjects",subject);
		return "user/update_subject";
	}
	
	//Handler to Modify Object with provided details
	@PostMapping("/subject-update/{id}")
	public String updateSubjectHandler(
			@PathVariable("id") long id,
			@ModelAttribute("subjects") Subject subject,
			HttpSession session) {
		try {
			subject.setSubjectCode(id);
			subjectRepository.save(subject);
			session.setAttribute("message", new Message("Successfully Updated Subject!", "alert-success"));

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("message", new Message("Something went wrong!", "alert-danger"));

		}
		return "redirect:/user/subject/" + subject.getSubjectCode() + "/edit";
	}
}
