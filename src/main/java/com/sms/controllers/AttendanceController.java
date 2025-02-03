package com.sms.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sms.entities.Attendance;
import com.sms.servicess.AttendanceService;

@Controller
@RequestMapping("/student/attendance")
public class AttendanceController {

	 private final AttendanceService attendanceService;

	 public AttendanceController(AttendanceService attendanceService) {
	     this.attendanceService = attendanceService;
	 }

	 @GetMapping("/{studentId}")
	 public List<Attendance> getAttendance(@PathVariable Long studentId) {
	     return attendanceService.getAttendanceByStudent(studentId);
	 }

	 @PostMapping("/{studentId}")
	 public Attendance markAttendance(@PathVariable Long studentId,
	                                @RequestParam String date,
	                                @RequestParam String present) {
	   return attendanceService.markAttendance(studentId, date, present);
	 }
}

