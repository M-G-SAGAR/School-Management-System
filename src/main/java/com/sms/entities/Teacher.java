package com.sms.entities;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Entity
public class Teacher {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long tid;
	private String firstName;
	private String secondName;
	private String className;
	private String section;
	private String gender;
	private LocalDate dob;
	private String address;
	private String religion;
	private String email;
	private String idNumber;
	private String nationality;
	private String phone;
	private String image;
	private String subject;
}
