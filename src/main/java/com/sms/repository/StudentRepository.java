
package com.sms.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.sms.entities.Student;

public interface StudentRepository extends JpaRepository<Student, Long> {

	@Query("SELECT s FROM Student s WHERE s.email = :email")
	public Student getStudentsByStudentName(@Param("email") String name);
	
	//@Query("SELECT s FROM Student s JOIN Fees f ON s.id = f.studentId WHERE s.id = :id")
	//Student findStudentWithFees(@Param("id") Long id);

	
}
