package com.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.entities.User;
import com.app.entities.Vehicle;

public interface IVehicleRepository extends JpaRepository<Vehicle, Integer> {
	
	List<Vehicle> findByUser(User id);
}
