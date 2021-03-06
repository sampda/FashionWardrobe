package com.fashionwardrobe.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.google.gson.annotations.Expose;

@SuppressWarnings("serial")
@Entity
public class UserDetails implements Serializable
{
@Id
private int userId;
@Expose
private String firstname;
@Expose
private String lastname;
@Expose
private String username;
@Expose
private String password;
@Expose
private String emailId;
@Expose
private String contactno;
@Expose
private String alternateContactno;
@Expose
private int cartId;

@OneToOne
@JoinColumn(name="userId", nullable=false, updatable=false, insertable = false)
private User user;

@OneToOne
@JoinColumn(name="cartId", insertable=false, nullable=false, updatable=false)
public Cart cart;
@OneToOne
@JoinColumn(name="billingId")
public BillingAddress billingAddress;
@OneToOne
@JoinColumn(name="shippingId")
public ShippingAddress shippingAddress;


@OneToOne
@JoinColumn(name="roleId")
private UserRole userRole;

@OneToOne
@JoinColumn(name="supplierId")
private Supplier supplier;

public int getUserId() {
	return userId;
}

public void setUserId(int userId) {
	this.userId = userId;
}

public String getFirstname() {
	return firstname;
}

public void setFirstname(String firstname) {
	this.firstname = firstname;
}

public String getLastname() {
	return lastname;
}

public void setLastname(String lastname) {
	this.lastname = lastname;
}

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getEmailId() {
	return emailId;
}

public void setEmailId(String emailId) {
	this.emailId = emailId;
}

public String getContactno() {
	return contactno;
}

public void setContactno(String contactno) {
	this.contactno = contactno;
}

public String getAlternateContactno() {
	return alternateContactno;
}

public void setAlternateContactno(String alternateContactno) {
	this.alternateContactno = alternateContactno;
}

public int getCartId() {
	return cartId;
}

public void setCartId(int cartId) {
	this.cartId = cartId;
}

public User getUser() {
	return user;
}

public void setUser(User user) {
	this.user = user;
}

public Cart getCart() {
	return cart;
}

public void setCart(Cart cart) {
	this.cart = cart;
}

public BillingAddress getBillingAddress() {
	return billingAddress;
}

public void setBillingAddress(BillingAddress billingAddress) {
	this.billingAddress = billingAddress;
}

public ShippingAddress getShippingAddress() {
	return shippingAddress;
}

public void setShippingAddress(ShippingAddress shippingAddress) {
	this.shippingAddress = shippingAddress;
}

public UserRole getUserRole() {
	return userRole;
}

public void setUserRole(UserRole userRole) {
	this.userRole = userRole;
}

public Supplier getSupplier() {
	return supplier;
}

public void setSupplier(Supplier supplier) {
	this.supplier = supplier;
}



}
