package com.sms.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

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
@Table(name = "user_Master")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private int userId;

	@NotBlank(message = "Name Is Required !!")
	@Size(min = 4, max = 20, message = "min 4 and max 20 characters are allowed !!")
	@Column(name = "user_name")
	private String userName;

	private String password;

	private String email;

	@Column(name = "user_type")
	private String userType;

	private String gender;

	private String schoolCode;

	private String address;

	private String phone;

	private String language;

	private String role;

	private String image;

	@Transient // Prevents persistence in the database
	private MultipartFile imageFile;
}
