package com.app.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.entities.Role;
import com.app.entities.Status;
import com.app.entities.User;

public interface IUserRepository extends JpaRepository<User, Integer> {

	User findByEmailAndPassword(String email, String pass);

	User findByEmailAndDob(String email, LocalDate dob);

	List<User> findByStatusAndRole(Status status, Role role);

	User findByEmail(String email);


}
