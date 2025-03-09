package com.sms.repository;

import java.util.Optional;

//Repository
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sms.entities.Fees;

@Repository
public interface FeesRepository extends JpaRepository<Fees, Long> {

	
	@Query("SELECT f FROM Fees f WHERE f.student.id = :studentId")
	Optional<Fees> findByStudentId(@Param("studentId") Long studentId);

	
}