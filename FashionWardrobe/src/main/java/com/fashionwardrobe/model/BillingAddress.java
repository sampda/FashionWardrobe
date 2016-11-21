package com.fashionwardrobe.model;


import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import com.google.gson.annotations.Expose;

@SuppressWarnings("serial")
@Entity
public class BillingAddress implements Serializable
{
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Expose
	private int billingId;
	@Expose
	private String address;
	@Expose
	private String landmark;
	@Expose
	private String state;
	@Expose
	private String city;
	@Expose
	private String pincode;
	@Expose
	private String district;
	   
	  
	
	
	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getDistrict() {
		return district;
	}


	public void setDistrict(String district) {
		this.district = district;
	}


	@OneToOne
		private UserDetails userDetails;



	public int getBillingId() {
		return billingId;
	}


	public void setBillingId(int billingId) {
		this.billingId = billingId;
	}


	public UserDetails getUserDetails() {
		return userDetails;
	}


	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}


	public String getLandmark() {
		return landmark;
	}


	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getPincode() {
		return pincode;
	}


	public void setPincode(String pincode) {
		this.pincode = pincode;
	}


	
       
}

