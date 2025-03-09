package com.sms.controllers;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sms.helper.Message;
import com.sms.serviceImpl.EmailServiceImpl;

@Controller
public class ForgotController {
	
	@Autowired
	private EmailServiceImpl emailServiceImpl;

	@GetMapping("/forgot-password")
	public String OpenSetting() {
		return "forgot_password";
	}
	
	@PostMapping("/send-otp") 
	public String sendOTP(@RequestParam("email") String email, HttpSession session) {
	    System.out.println("Email: " + email);

	    // Generating Random OTP
	    Random random = new Random();
	    int otp = random.nextInt(999999);
	    System.out.println("OTP: " + otp);

	    String subject = "OTP From SCM";  // Remove backticks ``
	    String message = "<h1> OTP = " + otp + " </h1>";
	    String to = email;

	    // Corrected order of parameters
	    boolean flag = this.emailServiceImpl.sendEmail(to, message, subject);

	    if (flag) {
	        session.setAttribute("message", new Message("Check Your Email !!", "alert-success"));
	        return "verify_otp";  // Typo fix: "varify_otp" -> "verify_otp"
	    } else {
	        session.setAttribute("message", new Message("Failed to send OTP !!", "alert-danger"));
	        return "forgot_password";
	    }
	}

}
