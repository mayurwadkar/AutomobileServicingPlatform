package com.app.entities;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.ToString;

@Entity
@Table(name = "appointments")

@ToString(exclude = { "user", "vehicle", "payment" })

public class Appointment extends BaseEntity {
	@Enumerated(EnumType.STRING)
	@Column(length = 20)
	private Status status;
	private LocalDate receivedDate;
	private LocalDate completedDate;
	private LocalTime receivedTime;
	private LocalTime completedTime;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@ManyToOne
	@JoinColumn(name = "vehicle_id")
	private Vehicle vehicle;

	@OneToOne(mappedBy = "appointment")
	private Payment payment;

	@ManyToOne
	@JoinColumn(name = "mechanic_id")
	private Mechanic mechanic;
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "appointments_services", joinColumns = @JoinColumn(name = "appointment_id"), inverseJoinColumns = @JoinColumn(name = "service_id"))
	private Set<Service> services = new HashSet<>();

	public Appointment() {
		super();
	}

	public Appointment(User user, Vehicle vehicle) {
		super();
		this.user = user;
		this.vehicle = vehicle;
		this.status = Status.PENDING;
		this.receivedDate = LocalDate.now();
		this.receivedTime = LocalTime.now();
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public LocalDate getReceivedDate() {
		return receivedDate;
	}

	public void setReceivedDate(LocalDate receivedDate) {
		this.receivedDate = receivedDate;
	}

	public LocalDate getCompletedDate() {
		return completedDate;
	}

	public void setCompletedDate(LocalDate completedDate) {
		this.completedDate = completedDate;
	}

	public LocalTime getReceivedTime() {
		return receivedTime;
	}

	public void setReceivedTime(LocalTime receivedTime) {
		this.receivedTime = receivedTime;
	}

	public LocalTime getCompletedTime() {
		return completedTime;
	}

	public void setCompletedTime(LocalTime completedTime) {
		this.completedTime = completedTime;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Vehicle getVehicle() {
		return vehicle;
	}

	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public Mechanic getMechanic() {
		return mechanic;
	}

	public void setMechanic(Mechanic mechanic) {
		this.mechanic = mechanic;
	}

	public Set<Service> getServices() {
		return services;
	}

	public void setServices(Set<Service> services) {
		this.services = services;
	}

}
