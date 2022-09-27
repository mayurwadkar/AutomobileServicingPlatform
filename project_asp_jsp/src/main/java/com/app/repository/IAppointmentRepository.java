package com.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.entities.Appointment;
import com.app.entities.Mechanic;
import com.app.entities.Status;
import com.app.entities.User;

public interface IAppointmentRepository extends JpaRepository<Appointment, Integer> {

	List<Appointment> findByStatusAndUser(Status status, User user);

	List<Appointment> findByUser(User user);

	List<Appointment> findByStatus(Status status);

	List<Appointment> findByStatusAndMechanic(Status status, Mechanic user);
}
