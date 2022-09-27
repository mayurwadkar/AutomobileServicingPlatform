package com.app.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.ToString;

@Entity
@Table(name = "services")
@ToString
public class Service extends BaseEntity {
	@Column(length = 20)
	private String serviceName;
	private double amount;


	public Service(String serviceName, double amount) {
		super();
		this.serviceName = serviceName;
		this.amount = amount;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Service() {
		super();
	}

}
