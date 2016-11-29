package com.fashionwardrobe.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.google.gson.annotations.Expose;

@Entity
public class WishList
{
	 @Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  @Expose
	  private int wishListId;
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

	public int getWishListId() {
		return wishListId;
	}

	public void setWishListId(int wishListId) {
		this.wishListId = wishListId;
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

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public int getProductDiscount() {
		return productDiscount;
	}

	public void setProductDiscount(int productDiscount) {
		this.productDiscount = productDiscount;
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

      
}
