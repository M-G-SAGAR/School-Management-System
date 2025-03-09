package com.sms.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Classes {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String teacher_Name;
	private String tid;
	private String class_Name;
	private String email;
	private String gender;
	private String subject;
	private String section;
	private String time;
	private String date;
	private String phone;
}
