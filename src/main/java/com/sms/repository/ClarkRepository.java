package com.sms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sms.entities.Clark;


@Repository
public interface ClarkRepository  extends JpaRepository<Clark,Integer>{

	
}
