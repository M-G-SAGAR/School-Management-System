package com.sms.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sms.entities.User;
import com.sms.repository.UserRepository;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserRepository userRepository;
	
	@ModelAttribute
	public void showUserAfterLogin(Model m, Principal p) {
		String userName = p.getName();
		System.out.println(userName);
		User user = userRepository.getUserByUserName(userName);
		System.out.println(user);
		m.addAttribute("user", user);
		
	}

	@GetMapping("/dashboard")
	public String userDashboard() {
		return "user/user_dashboard";
	}
	
	@GetMapping("/index")
	public String home() {
		return "user/user_index";
	}
	
	
}
