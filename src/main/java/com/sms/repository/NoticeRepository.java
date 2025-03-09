package com.sms.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sms.entities.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Long>{

}
