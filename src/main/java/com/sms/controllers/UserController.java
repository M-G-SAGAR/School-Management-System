package com.sms.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/dashboard")
	public String userDashboard() {
		return "user/user_dashboard";
	}
	
	@GetMapping("/index")
	public String home() {
		return "user/user_index";
	}
	
	
}
