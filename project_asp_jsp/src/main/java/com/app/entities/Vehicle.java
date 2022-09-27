package com.app.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.ToString;

@Entity
@Table(name = "vehicles")
@ToString
public class Vehicle extends BaseEntity {
	@Column(length = 20)
	private String vehicleNumber;
	@Column(length = 20)
	private String vehicleModel;
	@Column(length = 20)
	private String vehicleCompany;
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	public Vehicle(String vehicleNumber, String vehicleModel, String vehicleCompany) {
		super();
		this.vehicleNumber = vehicleNumber;
		this.vehicleModel = vehicleModel;
		this.vehicleCompany = vehicleCompany;
	}

	public Vehicle() {
		super();
	}

	public String getVehicleNumber() {
		return vehicleNumber;
	}

	public void setVehicleNumber(String vehicleNumber) {
		this.vehicleNumber = vehicleNumber;
	}

	public String getVehicleModel() {
		return vehicleModel;
	}

	public void setVehicleModel(String vehicleModel) {
		this.vehicleModel = vehicleModel;
	}

	public String getVehicleCompany() {
		return vehicleCompany;
	}

	public void setVehicleCompany(String vehicleCompany) {
		this.vehicleCompany = vehicleCompany;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
