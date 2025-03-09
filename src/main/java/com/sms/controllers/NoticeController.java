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

import com.sms.entities.Notice;
import com.sms.entities.User;
import com.sms.helper.Message;
import com.sms.repository.NoticeRepository;
import com.sms.repository.UserRepository;

@Controller
@RequestMapping("/user")
public class NoticeController {
	
	@Autowired
	private NoticeRepository noticeRepository;
	
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
	

	@GetMapping("/add-notice")
	public String createNotice() {
		return "user/add_notice";
	}
	
	//Handler for process the notice form
		@PostMapping("/create-notice")
		public String processAddNotice(
				@ModelAttribute("notice") Notice notice,
				Model model,
				HttpSession session) throws Exception {
				  
			try {
				//save notice
				noticeRepository.save(notice);
				session.setAttribute("message", new Message("Successfully Added Notice !!", "alert-success")); 
				System.out.println(notice);
				return "user/add_notice";
			} catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("message", new Message("Something Went Wrong !!", "alert-danger")); 
				return "user/add_notice";
			}
		}
		
		//Handler for show notice table
		@GetMapping("/show-notice")
		public String showNotices(Model model) {
			
			List<Notice> notices = this.noticeRepository.findAll();
			model.addAttribute("notices",notices);
			return "user/show_notice";
		}
		
		//Handler to get notice by id
		@GetMapping("/notice/{id}/show")
		public String showNotice(@PathVariable("id") long id,
				Model model) {
			
			Notice notice = noticeRepository.findById(id).orElseThrow();
			model.addAttribute("notice",notice);
			return "user/notice_details";
		}
		
		//Handler to delete notice by id
		@PostMapping("/notice/{id}/delete")
		public String deleteNotice(@PathVariable("id") long id) {
			
			noticeRepository.deleteById(id);
			return "redirect:/user/show-notice";
		}
		
		//Handler to update page to send blank object fill the field to modify
		@GetMapping("/notice/{id}/edit")
		public String updateNoticeForm(@PathVariable("id") long id, Model model) {
			
			Notice notice = noticeRepository.findById(id).get();
			model.addAttribute("notice",notice);
			return "user/update_notice";
		}
		
		//Handler to Modify Object with provided details
		@PostMapping("/notice-update/{id}")
		public String updateNoticeHandler(
				@PathVariable("id") long id,
				@ModelAttribute("notice") Notice notice,
				HttpSession session) {
			try {
				notice.setId(id);
				noticeRepository.save(notice);
				session.setAttribute("message", new Message("Successfully Updated Notice!", "alert-success"));

			} catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("message", new Message("Something went wrong!", "alert-danger"));

			}
			return "redirect:/user/notice/" + notice.getId() + "/edit";
		}
}
