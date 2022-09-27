package com.app.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.entities.Payment;
import com.app.entities.Role;
import com.app.entities.Status;
import com.app.entities.User;

public interface IPaymentRepository extends JpaRepository<Payment, Integer> {


}
