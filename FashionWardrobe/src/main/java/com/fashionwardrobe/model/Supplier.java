package com.fashionwardrobe.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import org.hibernate.validator.constraints.NotEmpty;
import com.google.gson.annotations.Expose;

@SuppressWarnings("serial")
@Entity
public class Supplier implements Serializable
{
	@Expose
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int supplierId;
	@Expose
	@NotEmpty(message="Company Name Name Should Not Be Empty")
	private String companyName;
	@Expose
	@NotEmpty(message="Supplier Description Name Should Not Be Empty")
	private String supplierDescription;
	@Expose	
	@NotEmpty(message="City Name Should Not Be Empty")
	private String city;
	@Expose
	@NotEmpty(message="State Name Should Not Be Empty")
	private String state;
	@Expose
	@NotEmpty(message="Pincode Name Should Not Be Empty")
	private String pincode;
	@Expose
	@NotEmpty(message="District Name Should Not Be Empty")
	private String district;
	@Expose
	@NotEmpty(message="Landmark Name Should Not Be Empty")
	private String landmark;
	@Expose
	@NotEmpty(message="Address Name Should Not Be Empty")
	private String address;
	@Expose
	private String companyUrl;
	
    @OneToOne
    @JoinColumn(name="userId")
	private UserDetails userDetails;
	
	
	public int getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getSupplierDescription() {
		return supplierDescription;
	}
	public void setSupplierDescription(String supplierDescription) {
		this.supplierDescription = supplierDescription;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCompanyUrl() {
		return companyUrl;
	}
	public void setCompanyUrl(String companyUrl) {
		this.companyUrl = companyUrl;
	}
	public UserDetails getUserDetails() {
		return userDetails;
	}
	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}
	
	
	
	
}
