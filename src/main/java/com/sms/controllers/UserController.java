package com.sms.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sms.entities.User;
import com.sms.helper.Message;
import com.sms.repository.UserRepository;

@Controller
public class UserController {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping("/signup")
	public String signup(Model model) {
		model.addAttribute("title" , "SignUp - School Management System");
		return "signup";
	}
	
	@GetMapping("/signin")
	public String signin(Model model) {
		model.addAttribute("title" , "SignIn - School Management System");
		model.addAttribute("user", new User());
		return "signin";
	}
	
	//Hander Of Signup
	@PostMapping("/do_signup")
	public String handleSingnUp(@Valid @ModelAttribute("user") User user, BindingResult bindingResult , Model model , HttpSession session) {
		try {
			
			if(bindingResult.hasErrors()) {
				
				
				FieldError name= bindingResult.getFieldError("userName");
				
				//Validation for userName Attribute
				if(name !=null) {
				model.addAttribute("userNameErrors", name.getDefaultMessage());
				}
				
				
				FieldError email = bindingResult.getFieldError("email");
				
				//Validation for email Attribute
				if(email !=null) {
				model.addAttribute("emailErrors", email.getDefaultMessage());
				}
				
				FieldError password = bindingResult.getFieldError("password");
				
				//Validation for password Attribute
				if(password !=null) {
				model.addAttribute("passwordErrors", password.getDefaultMessage());
				}
				
				
				FieldError type= bindingResult.getFieldError("userType");
				
				//Validation for userType Attribute
				if(type !=null) {
				model.addAttribute("userTypeErrors", type.getDefaultMessage());
				}
				
				System.out.println("ERROR "+bindingResult.toString());
				model.addAttribute("user", user);
				return "signup";
			}
			
			user.setRole("ROLE_USER");
			user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
			
			userRepository.save(user);
			model.addAttribute("user", new User());
			session.setAttribute("message", new Message("Successfully SignUp !!", "alert-success"));
			
			return "signup";
			
		} catch (Exception e) {
			model.addAttribute("user",user);
			session.setAttribute("message", new Message("Something went Wrong !!"+e.getMessage(), "alert-danger"));
			return "signup";
		}
		
		
	}
	
	@GetMapping("/home")
	public String home(Model model) {
		model.addAttribute("title" , "Home - School Management System");
		return "home";
	}
	
	@GetMapping("/about")
	public String about(Model model) {
		model.addAttribute("title" , "About - School Management System");
		return "about";
	}
}
