package com.fashionwardrobe.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import com.google.gson.annotations.Expose;

@SuppressWarnings("serial")
@Entity
public class CartItem implements Serializable
{
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Expose
  private int cartItemId;
  @Expose
  private int cartId;
  @Expose
  private int userId;
  @Expose
  private int productId;
  @Expose
  private String productName;
  @Expose
  private int productQuantity;
  @Expose
  private int productPrice;
  @Expose
  private boolean flag;
  @Expose
  private Date orderDate;
  @Expose
  private int amount;
  @Expose
  private int productDiscount;
  
  @ManyToOne
  @JoinColumn(name="cartId",nullable=false,insertable=false,updatable=false)
  private Cart cart;
  
  @ManyToOne
  @JoinColumn(name="userId",nullable=false,insertable=false,updatable=false)
  private User user;
  
  @ManyToOne
  @JoinColumn(name="productId",nullable=false,insertable=false,updatable=false)
  private Product product;



public int getCartItemId() {
	return cartItemId;
}

public void setCartItemId(int cartItemId) {
	this.cartItemId = cartItemId;
}

public int getCartId() {
	return cartId;
}

public void setCartId(int cartId) {
	this.cartId = cartId;
}

public int getUserId() {
	return userId;
}

public void setUserId(int userId) {
	this.userId = userId;
}


public int getProductId() {
	return productId;
}

public void setProductId(int productId) {
	this.productId = productId;
}

public String getProductName() {
	return productName;
}

public void setProductName(String productName) {
	this.productName = productName;
}


public Cart getCart() {
	return cart;
}

public void setCart(Cart cart) {
	this.cart = cart;
}

public User getUser() {
	return user;
}

public void setUser(User user) {
	this.user = user;
}

public Product getProduct() {
	return product;
}

public void setProduct(Product product) {
	this.product = product;
}

public boolean isFlag() {
	return flag;
}

public void setFlag(boolean flag) {
	this.flag = flag;
}



public int getProductQuantity() {
	return productQuantity;
}

public void setProductQuantity(int productQuantity) {
	this.productQuantity = productQuantity;
}

public int getProductPrice() {
	return productPrice;
}

public void setProductPrice(int productPrice) {
	this.productPrice = productPrice;
}

public Date getOrderDate() {
	return orderDate;
}

public void setOrderDate(Date orderDate) {
	this.orderDate = orderDate;
}

public int getAmount() {
	return amount;
}

public void setAmount(int amount) {
	this.amount = amount;
}

public int getProductDiscount() {
	return productDiscount;
}

public void setProductDiscount(int productDiscount) {
	this.productDiscount = productDiscount;
}


}
