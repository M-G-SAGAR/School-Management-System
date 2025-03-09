package com.sms.entities;

import javax.persistence.*;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Fees {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String first_name;      // 🟢 Auto-fill
    private String last_name;
    private String className;
    private String paymentMethod;    // 🟢 Manually fill
    private String date;             // 🟢 Manually fill
    private Double totalFees;
    private Double paidFees;         // 🟢 Manually fill
    private Double dueFees;          // 🟢 Auto-calculate
    private boolean status;          // 🟢 Manually fill
    
    // 🟢 ManyToOne Relationship with Student
    @ManyToOne
    @JoinColumn(name = "student_id", referencedColumnName = "user_id")
    private Student student;

}
