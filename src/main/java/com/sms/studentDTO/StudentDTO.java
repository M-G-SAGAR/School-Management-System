package com.sms.studentDTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StudentDTO {
    private Long id;
    private String firstName;
    private String lastName;
    private String className;
    private Double totalFees;
    private Double paidFees;
    private Double dueFees;

    public StudentDTO(Long id, String firstName, String lastName, String className, Double totalFees, Double paidFees, Double dueFees) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.className = className;
        this.totalFees = totalFees;
        this.paidFees = paidFees;
        this.dueFees = dueFees;
    }

    // Getters and setters
}

