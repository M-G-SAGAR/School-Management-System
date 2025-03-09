package com.sms.controllers;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sms.entities.Attendance;
import com.sms.entities.Notice;
import com.sms.entities.Student;
import com.sms.entities.User;
import com.sms.helper.Message;
import com.sms.repository.AttendanceRepository;
import com.sms.repository.NoticeRepository;
import com.sms.repository.StudentRepository;
import com.sms.repository.UserRepository;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private StudentRepository studentRepository;

	@Autowired
	private AttendanceRepository attendanceRepository;

	@Autowired
	private NoticeRepository noticeRepository;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	// Data For All Common Page Like Title
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
	public String home(Model model) {

		List<Notice> notice = noticeRepository.findAll();
		model.addAttribute("notice", notice);
		return "user/user_index";
	}

	// Handler For Password Change
	@GetMapping("/change-password")
	public String changePassword() {
		return "user/change_password";

	}

	// Logic Or Process of Change Password
	@PostMapping("/process-change-pass")
	public String processChangePass(@RequestParam("oldPassword") String oldPassword,
			@RequestParam("newPassword") String newPassword, Principal principal, HttpSession httpSession) {
		System.out.println("Old Password " + oldPassword);
		System.out.println("New Password " + newPassword);

		String userName = principal.getName();
		User userByUserName = this.userRepository.getUserByUserName(userName);
		System.out.println(userByUserName.getPassword());

		if (this.bCryptPasswordEncoder.matches(oldPassword, userByUserName.getPassword())) {
			// Change New Password

			userByUserName.setPassword(this.bCryptPasswordEncoder.encode(newPassword));
			this.userRepository.save(userByUserName);

			httpSession.setAttribute("message",
					new Message("Your Password Is Successfully Changed..", "alert-success"));
		} else {
			// Error...
			httpSession.setAttribute("message", new Message("Please Check Your Old Password..", "alert-danger"));
			return "redirect:/user/change-password";
		}

		return "redirect:/user/index";
	}

	@GetMapping("/account/{userId}/show")
	public String accountSetting(@PathVariable("userId") int userId, Model model) {

		User user = userRepository.findById(userId).orElseThrow();

		model.addAttribute("user", user);
		return "user/account";
	}

	// Handler to Modify Object with provided details
	@PostMapping("/user-update/{id}")
	public String updateUserHandler(@PathVariable("id") int id, @ModelAttribute("user") User user,
			@RequestParam("imageFile") MultipartFile image,
			HttpSession session) {

		try {
			User userOld = userRepository.findById(id).orElseThrow();

			// Handle Student Image
			if (!image.isEmpty()) {
				// Get the folder where images are stored
				File saveFile = new ClassPathResource("static/img").getFile();

				// Delete old image
				File oldFile = new File(saveFile, userOld.getImage());
				if (oldFile.exists()) {
					oldFile.delete();
					System.out.println("Old User Image Deleted: " + oldFile.getAbsolutePath());
				}

				// Save new image
				Path userPath = Paths.get(saveFile.getAbsolutePath(), image.getOriginalFilename());
				Files.copy(image.getInputStream(), userPath, StandardCopyOption.REPLACE_EXISTING);
				System.out.println("New User Image Saved: " + userPath.toString());

				user.setImage(image.getOriginalFilename());
			} else {
				user.setImage(userOld.getImage()); // Keep old image if no new file is uploaded
			}


			user.setUserId(id);
			userRepository.save(user);
			session.setAttribute("message", new Message("Successfully Updated User!", "alert-success"));

		} catch (Exception e) {
			e.printStackTrace(); // Print full error details in console
			session.setAttribute("message", new Message("Something Went Wrong!", "alert-danger"));
		}

		return "redirect:/user/account/" + user.getUserId() + "/show";
	}

}
