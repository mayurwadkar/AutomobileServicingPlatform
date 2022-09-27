package com.app.entities;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.ToString;

@Entity
@Table(name = "addresses")
@ToString(exclude = "user")
public class Address extends BaseEntity {
	@Column(length = 100)
	private String address;
	@Column(length = 20)
	private String city;
	@Column(length = 20)
	private String district;
	@Column(length = 20)
	private String zipCode;
	@Column(length = 20)
	private String state;
	@Column(length = 50)
	private String landmark;
	@Column(length = 20)
	private String houseNo;
	@OneToOne(cascade = CascadeType.ALL)
	@MapsId
	private User user;

	public Address(String address, String city, String district, String zipCode, String state, String landmark,
			String houseNo) {
		super();
		this.address = address;
		this.city = city;
		this.district = district;
		this.zipCode = zipCode;
		this.state = state;
		this.landmark = landmark;
		this.houseNo = houseNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getLandmark() {
		return landmark;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

	public String getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Address() {
		super();
	}
	
	public Address(Integer id,String address, String city, String district, String zipCode, String state, String landmark,
			String houseNo) {
		super(id);
		this.address = address;
		this.city = city;
		this.district = district;
		this.zipCode = zipCode;
		this.state = state;
		this.landmark = landmark;
		this.houseNo = houseNo;
	}
	
	
}
