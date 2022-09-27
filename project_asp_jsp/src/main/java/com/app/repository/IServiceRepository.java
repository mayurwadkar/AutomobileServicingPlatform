package com.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.entities.Service;

public interface IServiceRepository extends JpaRepository<Service, Integer> {

}
