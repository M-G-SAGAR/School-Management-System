package com.sms.controllers;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sms.entities.Classes;
import com.sms.entities.User;
import com.sms.helper.Message;
import com.sms.repository.ClassRepository;
import com.sms.repository.UserRepository;

@Controller
@RequestMapping("/user")
public class ClassController {
	
	@Autowired
	private ClassRepository classRepository;
	
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

	@GetMapping("/add-class")
	public String createClass() {
		return "user/add_class";
	}

	
	  //Handler for process the Teacher form
	  
	  @PostMapping("create-class") 
	  public String processAddClass(
				  @ModelAttribute("classes") Classes classes, 
				  Model model, 
				  Principal principal,
				  HttpSession session)
	  {
	  
	  try { 
		  classRepository.save(classes); 
		  session.setAttribute("message", new Message("Successfully Added Class !!", "alert-success")); 
		  System.out.println(classes);
		  return "user/add_class";
	  
	  } catch (Exception e) { 
		  session.setAttribute("message", new Message("Somethings Went Wrong Class Not Added !!", "alert-success"));
	  return "user/add_class"; 
	  } 
	  }
	 
	//Handler For show class table
	  @GetMapping("/show-class")
		public String showClass(Model model) {
			List<Classes> classes = this.classRepository.findAll();
			
			model.addAttribute("classes",classes);
			return "user/show_class";
		}
	  
	  	//Handler For Get Class By Id 
		@GetMapping("/class/{id}/show")
		public String showClass(@PathVariable("id") long id, Model model) {
		    	Classes classes = classRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid Class ID: " + id));;
		   
		        model.addAttribute("classes", classes);
		        return "user/class_details";  // Correct view name
		}

		//Handler to delete student by ID
		@PostMapping("/class/{id}/delete")
		public String deleteClass(@PathVariable("id") long id) {
		    classRepository.deleteById(id);
		    return "redirect:/user/show-class";
		}
		
		//Handler to update page to send blank object fill the field to modify
		@GetMapping("/class/{id}/edit")
		public String updateClassForm(@PathVariable("id") long id, Model model) {
			
			Classes classes = classRepository.findById(id).get();
			model.addAttribute("classes",classes);
			return "user/update_class";
		}
		
		//Handler to Modify Object with provided details
		@PostMapping("/class-update/{id}")
		public String updateClassHandler(
		        @PathVariable("id") long id,
		        @ModelAttribute("classes") Classes classes,
		        HttpSession session) {

		    try {
		        classes.setId(id);
		        classRepository.save(classes);
		        session.setAttribute("message", new Message("Successfully Updated Class!", "alert-success"));

		    } catch (Exception e) {
		        e.printStackTrace(); // Print full error details in console
		        session.setAttribute("message", new Message("Something Went Wrong!", "alert-danger"));
		    }

		    return "redirect:/user/class/" + classes.getId() + "/edit";
		}

}
