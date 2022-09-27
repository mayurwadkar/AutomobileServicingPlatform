package com.app.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.ToString;

@Entity
@Table(name = "mechanics")

@ToString
public class Mechanic extends BaseEntity {
	@Column(length = 20)
	private String firstName;
	@Column(length = 20)
	private String lastName;
	@Column(length = 20, unique = true)
	private String email;
	@Column(length = 50)
	private String password;
	@Transient
	@Column(length = 20)
	private String confirmPassword;
	@Column(length = 20)
	private String mobileNumber;
	@Enumerated(EnumType.STRING)
	@Column(length = 20)
	private Role role;
	@Enumerated(EnumType.STRING)
	@Column(length = 20)
	private Status status;
	private LocalDate dob;
	private String workingStatus;

	public Mechanic() {
		super();
	}

	public Mechanic(String firstName, String lastName, String email, String password, String confirmPassword,
			String mobileNumber, Role role, LocalDate dob) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.mobileNumber = mobileNumber;
		this.role = role;
		this.status = Status.ACTIVE;
		this.dob = dob;
		this.workingStatus = "FREE";
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public Mechanic(Integer id, String firstName, String lastName, String email, String password, String mobileNumber,Role role, LocalDate dob, String workingStatus) {
		super(id);
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.mobileNumber = mobileNumber;
		this.password = password;
		this.role = role;
		this.status = Status.ACTIVE;
		this.dob = dob;
		this.workingStatus = workingStatus;
	}

	public Mechanic(String email, String password, LocalDate dob) {
		super();
		this.email = email;
		this.password = password;
		this.dob = dob;
	}

	public LocalDate getDob() {
		return dob;
	}

	public void setDob(LocalDate dob) {
		this.dob = dob;
	}

	public String getWorkingStatus() {
		return workingStatus;
	}

	public void setWorkingStatus(String workingStatus) {
		this.workingStatus = workingStatus;
	}
		

}
