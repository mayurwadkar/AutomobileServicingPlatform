package com.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.entities.MechanicAddress;

public interface IMechanicAddressRepository extends JpaRepository<MechanicAddress, Integer> {

}
