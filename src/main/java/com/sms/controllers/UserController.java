package com.sms.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sms.entities.Attendance;
import com.sms.entities.Student;
import com.sms.entities.User;
import com.sms.helper.Message;
import com.sms.repository.AttendanceRepository;
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
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//Data For All Common Page Like Title
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
	
	//For Attendance
	@GetMapping("/attendance")
	public String attendance(Model model) {
		
		List<Student> students = this.studentRepository.findAll();
		model.addAttribute("students", students); 
		return "user/attendance";
	}
	
	@PostMapping("/submitAttendance")
    public String submitAttendance(@RequestParam("date") String date,
                                   @RequestParam Map<String, String> allParams,Student students,
                                   Model model) {

        // Process the attendance data
        Map<Integer, String> attendanceMap = allParams.entrySet().stream()
                .filter(entry -> entry.getKey().startsWith("attendance"))
                .collect(Collectors.toMap(
                        entry -> Integer.parseInt(entry.getKey().replaceAll("[^0-9]", "")),
                        Map.Entry::getValue
                ));
        
        
        // Save each attendance record to the database
        List<Attendance> attendanceList = new ArrayList<>();
        for (Map.Entry<Integer, String> entry : attendanceMap.entrySet()) {
            Integer studentId = entry.getKey();
            String presence = entry.getValue();

         // Convert studentId to Long
            Long studentIdLong = Long.valueOf(studentId);
            

            // Fetch the Student object by studentId
            Student student = studentRepository.findById(studentIdLong)
                    .orElseThrow(() -> new RuntimeException("Student not found with id: " + studentId));

            // Build Attendance object
            Attendance attendance = Attendance.builder()
            .student(student)
            .date(date)
            .present(presence)
            .build();

            attendanceList.add(attendance);
        }
        attendanceRepository.saveAll(attendanceList); // Save the list of attendance records


        // Add data to the model to display on the confirmation page
        model.addAttribute("date", date);
        model.addAttribute("attendanceMap", attendanceMap);
        model.addAttribute("students", students); 
        
        // Return the view name to display (confirmation page)
        return "user/attendanceConfirmation"; // This should correspond to an attendanceConfirmation.jsp or .html
    }
	
	
	//Handler For Password Change
	@GetMapping("/change-password")
	public String changePassword() {
		return "user/change_password";
		
	}
	
	//Logic Or Process of Change Password
	@PostMapping("/process-change-pass")
	public String processChangePass(@RequestParam("oldPassword") String oldPassword, @RequestParam("newPassword") String newPassword, Principal principal, HttpSession httpSession) {
		System.out.println("Old Password "+oldPassword);
		System.out.println("New Password "+newPassword);
		
		String userName = principal.getName();
		User userByUserName = this.userRepository.getUserByUserName(userName);
		System.out.println(userByUserName.getPassword());
		
		if(this.bCryptPasswordEncoder.matches(oldPassword, userByUserName.getPassword())) {
			//Change New Password
			
			userByUserName.setPassword(this.bCryptPasswordEncoder.encode(newPassword));
			this.userRepository.save(userByUserName);
			
			httpSession.setAttribute("message", new Message("Your Password Is Successfully Changed..", "alert-success"));
		}else {
			//Error...
			httpSession.setAttribute("message", new Message("Please Check Your Old Password..", "alert-danger"));
			return "redirect:/user/change-password";
		}
		
		return "redirect:/user/index";
	}
	
	
}
