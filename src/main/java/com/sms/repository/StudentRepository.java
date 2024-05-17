
package com.sms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.sms.entities.Student;

public interface StudentRepository extends JpaRepository<Student, Long> {

	@Query("SELECT u FROM Student u WHERE u.id = :id")
	public List<Student> findStudentsByUser(@Param("id") long id);
}
