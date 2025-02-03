package com.sms.servicess;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.sms.entities.Attendance;
import com.sms.entities.Student;
import com.sms.repository.AttendanceRepository;
import com.sms.repository.StudentRepository;

@Service
public class AttendanceService {

    private final AttendanceRepository attendanceRepository;
    private final StudentRepository studentRepository;

    public AttendanceService(AttendanceRepository attendanceRepository, StudentRepository studentRepository) {
        this.attendanceRepository = attendanceRepository;
        this.studentRepository = studentRepository;
    }

    public List<Attendance> getAttendanceByStudent(Long studentId) {
        return attendanceRepository.findByStudentId(studentId);
    }

    public Attendance markAttendance(Long studentId, String date, String present) {
        Student student = studentRepository.findById(studentId)
                .orElseThrow(() -> new RuntimeException("Student not found"));

        Attendance attendance = new Attendance();
        attendance.setStudent(student);
        attendance.setDate(date);
        attendance.setPresent(present);

        return attendanceRepository.save(attendance);
    }
}
