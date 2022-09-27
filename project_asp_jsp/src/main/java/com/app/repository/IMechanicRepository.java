package com.app.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.entities.Mechanic;
import com.app.entities.Role;
import com.app.entities.Status;

public interface IMechanicRepository extends JpaRepository<Mechanic, Integer> {

	Mechanic findByEmailAndPassword(String email, String pass);

	Mechanic findByEmailAndDob(String email, LocalDate dob);

	List<Mechanic> findByStatusAndRole(Status status, Role role);
	
	List<Mechanic> findByStatusAndRoleAndWorkingStatus(Status status, Role role, String workingStatus);

	Mechanic findByEmail(String email);

}
