package com.sms.controllers;

import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ForgotController {

	@GetMapping("/forgot-password")
	public String OpenSetting() {
		return "forgot_password";
	}
	
	@PostMapping("/send-otp")
	public String sendOTP(@RequestParam("email") String email) {
		System.out.println("Email "+email);
		
		//Generating Random Otp
		Random random = new Random();
		int otp = random.nextInt(999999);
		System.out.println("OTP "+otp);
		
		
		return "varify_otp";
	}
}
