package com.sms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.sms.entities.Teacher;

public interface TeacherRepository extends JpaRepository<Teacher, Long> {


	@Query("SELECT t FROM Teacher t WHERE t.email = :email")
	public Teacher getTeachersByTeacherName(@Param("email") String name);

	public Teacher findById(long id);
}
