package com.sms.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sms.entities.Classes;

public interface ClassRepository extends JpaRepository<Classes, Long> {

}
