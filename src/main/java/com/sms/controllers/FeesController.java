package com.sms.controllers;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sms.entities.Fees;
import com.sms.entities.Student;
import com.sms.helper.Message;
import com.sms.repository.FeesRepository;
import com.sms.repository.StudentRepository;
import com.sms.studentDTO.StudentDTO;

@Controller
@RequestMapping("/user")
public class FeesController {
    
    @Autowired
    private StudentRepository studentRepository;
    
    @Autowired
    private FeesRepository feesRepository;
    
    @GetMapping("/pay-fees")
    public String showPaymentPage(Model model) {
        model.addAttribute("feesList", new Fees());
        return "user/fees_payment";
    }

    @GetMapping("/students/ids")
    @ResponseBody
    public List<Long> getStudentIds() {
        return studentRepository.findAll().stream().map(Student::getId).collect(Collectors.toList());
    }

    @GetMapping("/students/details")
    public ResponseEntity<?> getStudentDetails(@RequestParam(name = "id", required = true) String id, Model model) {
    	
        if (id == null || id.isEmpty()) {
            return ResponseEntity.badRequest().body("Student ID is required.");
        }

        try {
            Long studentId = Long.parseLong(id);
            Optional<Student> student = studentRepository.findById(studentId);
           
            
            if (student.isPresent()) {
                Student student1 = student.get();

                //  Set default total fees if null
                if (student1.getTotalFees() == null) {
                    student1.setTotalFees(10000.0);
                }
                
                //  Fetch fees for the student
                Optional<Fees> feesOptional = feesRepository.findByStudentId(studentId);
                if (feesOptional.isPresent()) {
                    Fees fees = feesOptional.get();
                    Double dueFees = fees.getDueFees() != null ? fees.getDueFees() : 0.0;
                    
                   // model.addAttribute("dueFees", dueFees);
                    
                    System.out.println(dueFees);
                    
                    student1.setDueFees(dueFees);  // Set due fees in student object
                } else {
                    student1.setDueFees(0.0);  // Set 0.0 if no fees record found
                }

                
               
                return ResponseEntity.ok(student1);
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Student not found.");
            }
        } catch (NumberFormatException e) {
            return ResponseEntity.badRequest().body("Invalid Student ID format.");
        }
    }

    @Transactional
    @PostMapping("/save-fees")
    public String saveFees(@ModelAttribute Fees fees, @RequestParam("studentId") Long studentId, HttpSession session) {
        Optional<Student> studentOptional = studentRepository.findById(studentId);
        Optional<Fees> feesById = feesRepository.findByStudentId(studentId);  // Check by student ID, not fee ID
        
        if (studentOptional.isPresent()) {
            Student student = studentOptional.get();

            // Fix for null values
            double totalFees = (student.getTotalFees() != null) ? student.getTotalFees() : 10000.0;
            double paidFees = (fees.getPaidFees() != null) ? fees.getPaidFees() : 0.0;
            double dueFees = (fees.getDueFees() != null) ? fees.getDueFees() : totalFees - paidFees;
            
            if(fees.getDueFees() != null) {
            	dueFees = dueFees - paidFees;
            }

            student.setTotalFees(totalFees);
            student.setPaidFees(paidFees);  // Accumulate paid fees
            student.setDueFees(dueFees);
            student.setStatus(dueFees == 0);

            fees.setStudent(student);
            fees.setFirst_name(student.getFirstName());
            fees.setLast_name(student.getLastName());
            fees.setClassName(student.getClassName());
            fees.setPaymentMethod(fees.getPaymentMethod());
            fees.setTotalFees(student.getTotalFees());
            fees.setPaidFees(student.getPaidFees());
            fees.setDueFees(student.getDueFees());
            fees.setStatus(dueFees == 0);

            if (feesById.isPresent()) {
                // Update existing fee record
                Fees existingFees = feesById.get();
                existingFees.setPaidFees(existingFees.getPaidFees() + paidFees);  // Accumulate paid fees
                existingFees.setDueFees(dueFees);
                existingFees.setPaymentMethod(fees.getPaymentMethod());
                existingFees.setStatus(dueFees == 0);
                feesRepository.save(existingFees);  // Update record
                session.setAttribute("message", new Message("Payment Successfully !!", "alert-success"));
            } else {
                feesRepository.save(fees);  // Insert new record if none exists
                session.setAttribute("message", new Message("Something Went Wrong !!", "alert-danger"));
            }
        }
        return "redirect:/user/pay-fees";
    }

    @GetMapping("/show-students-fees")
    public String showFeesTable(Model model) {
    	
    	List <Fees> feesList = feesRepository.findAll();
   
        model.addAttribute("feesList", feesList);
        
        return "user/show_student_fees";
    }


}
