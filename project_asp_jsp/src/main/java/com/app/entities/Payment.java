package com.app.entities;

import java.time.LocalDate;
import java.time.LocalTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "payments")
@Getter
@Setter
@ToString
@NoArgsConstructor
public class Payment extends BaseEntity {
	private LocalDate paymentDate;
	private LocalTime paymentTime;
	private double amount;
	@Column(length = 20)
	private String paymentMode;
	@Column(length = 30)
	private String transcationId;
	@OneToOne
	@JoinColumn(name = "appointment_id", unique = true)
	private Appointment appointment;

	public Payment(double amount, String paymentMode, String transcationId) {
		super();
		this.amount = amount;
		this.paymentMode = paymentMode;
		this.transcationId = transcationId;
		this.paymentDate = LocalDate.now();
		this.paymentTime = LocalTime.now();
	}
	
	public Payment(int id,double amount, String paymentMode, String transcationId) {
		super(id);
		this.amount = amount;
		this.paymentMode = paymentMode;
		this.transcationId = transcationId;
		this.paymentDate = LocalDate.now();
		this.paymentTime = LocalTime.now();
	}

}
