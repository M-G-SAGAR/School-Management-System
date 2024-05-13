package com.sms.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

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
@Table(name ="clark_Master")
public class Clark {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="clark_Id")
	private int Id ;
	
	@Column(name="clark_name")
	private String name;
	private String password;
	private String clark_type;
	private String email;
	private long phone ;
	private String address;

}
