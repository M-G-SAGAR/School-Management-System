package com.sms.controllers;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sms.entities.User;
import com.sms.helper.Message;
import com.sms.repository.UserRepository;

@Controller
public class HomeController {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@GetMapping("/signup")
	public String signup(Model model) {
		model.addAttribute("title", "SignUp - School Management System");
		return "signup";
	}

	@GetMapping("/signin")
	public String signin(Model model) {
		model.addAttribute("title", "SignIn - School Management System");
		model.addAttribute("user", new User());
		return "signin";
	}

	// Hander Of Signup
	@PostMapping("/do_signup")
	public String handleSingnUp(
			@Valid 
			@ModelAttribute("user") User user, 
			@RequestParam("imageFile") MultipartFile file,
			BindingResult bindingResult, 
			Model model,
			HttpSession session) {
		try {

			if (bindingResult.hasErrors()) {

				FieldError name = bindingResult.getFieldError("userName");

				// Validation for userName Attribute 1
				if (name != null) {
					model.addAttribute("userNameErrors", name.getDefaultMessage());
				}

				FieldError email = bindingResult.getFieldError("email");

				// Validation for email Attribute 2
				if (email != null) {
					model.addAttribute("emailErrors", email.getDefaultMessage());
				}

				FieldError password = bindingResult.getFieldError("password");

				// Validation for password Attribute 3
				if (password != null) {
					model.addAttribute("passwordErrors", password.getDefaultMessage());
				}

				FieldError type = bindingResult.getFieldError("userType");

				// Validation for userType Attribute 4
				if (type != null) {
					model.addAttribute("userTypeErrors", type.getDefaultMessage());
				}

				FieldError gender = bindingResult.getFieldError("gender");

				// Validation for userType Attribute 5
				if (gender != null) {
					model.addAttribute("genderErrors", type.getDefaultMessage());
				}
				
				FieldError schoolCode = bindingResult.getFieldError("schoolCode");

				// Validation for userType Attribute 6
				if (schoolCode != null) {
					model.addAttribute("schoolCodeErrors", type.getDefaultMessage());
				}
				
				FieldError address = bindingResult.getFieldError("address");

				// Validation for userType Attribute 7
				if (address != null) {
					model.addAttribute("addressErrors", type.getDefaultMessage());
				}
				
				FieldError phone = bindingResult.getFieldError("phone");

				// Validation for userType Attribute 8
				if (phone != null) {
					model.addAttribute("phoneErrors", type.getDefaultMessage());
				}
				
				FieldError language = bindingResult.getFieldError("language");

				// Validation for userType Attribute 9
				if (language != null) {
					model.addAttribute("languageErrors", type.getDefaultMessage());
				}
				
				
				System.out.println("ERROR " + bindingResult.toString());
				model.addAttribute("user", user);
				return "signup";
			}

			user.setRole("ROLE_USER");
			user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
			
			/* image processing 10 */
			if(file.isEmpty()) {
				//if the file is empty then try our message
				System.out.println("FIle Not Uploaded.....");
				user.setImage("student.png");
			}else {
				//file to folder and update the name to student
				user.setImage(file.getOriginalFilename());
				
				File saveFile = new ClassPathResource("static/img").getFile();
				Path path = Paths.get(saveFile.getAbsolutePath()+File.separator+file.getOriginalFilename());
				Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
				
				
				System.out.println("Image Uploaded.....");
			}

			userRepository.save(user);
			model.addAttribute("user", new User());
			session.setAttribute("message", new Message("Successfully SignUp !!", "alert-success"));

			return "signup";

		} catch (Exception e) {
			model.addAttribute("user", user);
			session.setAttribute("message", new Message("Something went Wrong !!" + e.getMessage(), "alert-danger"));
			return "signup";
		}

	}

	@GetMapping("/home")
	public String home(Model model) {
		model.addAttribute("title", "Home - School Management System");
		return "home";
	}

	@GetMapping("/about")
	public String about(Model model) {
		model.addAttribute("title", "About - School Management System");
		return "about";
	}

	@GetMapping("/test")
	public String test() {
		return "user_index";
	}

}
