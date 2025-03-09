package com.sms.entities;

import java.util.List;
import javax.persistence.*;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Entity
@Table(name = "students")
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private long id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    private String email;
    private String dob;
    private String gender;
    private String address;
    private String contact;
    
    @Column(name = "class_name")
    private String className;

    private String section;

    @Column(name = "roll_name")
    private long rollNumber;

    @Column(name = "parents_contact")
    private String parentsContact;

    private String addmissionNo;
    private String religion;

    // parents info
    @Column(name = "father_name")
    private String fatherName;

    @Column(name = "mother_name")
    private String motherName;

    private String nationality;

    @Column(name = "father_occupation")
    private String fatherOccupation;

    @Column(name = "mother_occupation")
    private String motherOccupation;

    @Column(name = "present_address")
    private String presentAddress;

    @Column(name = "permanent_address")
    private String permanentAddress;

    private String image;
    private String parentImage;

    //This Field Are Not Save In DB
    @Transient
    private Double totalFees;
    @Transient
    private Double paidFees;
    @Transient						// 🟢 Manually fill
    private Double dueFees;         // 🟢 Auto-calculate
    @Transient						// 🟢 Manually fill
    private boolean status;
    
    
    
    // 🟢 OneToMany Relationship with Fees
//    @OneToMany(mappedBy = "student", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//    private List<Fees> feesList;
//    
    
	/*
	 * 
	 * @Transient public Double getDueFees() { return getTotalFees() -
	 * getPaidFees(); }
	 * 
	 * @Transient public String getStatus() { return getDueFees() > 0 ? "Pending" :
	 * "Paid"; }
	 */
}
