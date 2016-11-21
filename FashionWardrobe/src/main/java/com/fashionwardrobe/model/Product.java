package com.fashionwardrobe.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.google.gson.annotations.Expose;


@SuppressWarnings("serial")
@Entity
public class Product implements Serializable
{
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Expose
    private int productId;
	@Expose
	private String productName;
	@Expose
	private String productDesc;
	@Expose
	private int productPrice;
	@Expose
	private int productQauntity;
	@Expose
	private int productDiscount;
	@Expose
	private int subCategoryId;
	@Expose
	private int supplierId;
	@Expose
	private int categoryId;
	@Expose
	private Date date;
	@Expose
	private boolean enabled;
	@Transient
	private MultipartFile productImage;

	@ManyToOne
	@JoinColumn(name="subCategoryId" ,nullable=false,insertable=false,updatable=false)
	private Subcategory subcategory;
	
	@ManyToOne
	@JoinColumn(name="supplierId" ,nullable=false,insertable=false,updatable=false)
	private Supplier supplier;

	@ManyToOne
	@JoinColumn(name="categoryId" ,nullable=false,insertable=false,updatable=false)
	private Category category;
	
	
	public int getProductDiscount() {
		return productDiscount;
	}

	public void setProductDiscount(int productDiscount) {
		this.productDiscount = productDiscount;
	}

	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public int getProductQauntity() {
		return productQauntity;
	}

	public void setProductQauntity(int productQauntity) {
		this.productQauntity = productQauntity;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	
	

	public String getProductName() 
	{
		return productName;
	}

	public void setProductName(String productName) 
	{
		this.productName = productName;
	}

	public String getProductDesc() 
	{
		return productDesc;
	}

	public void setProductDesc(String productDesc) 
	{
		this.productDesc = productDesc;
	}

	
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getSubCategoryId() {
		return subCategoryId;
	}

	public void setSubCategoryId(int subCategoryId) {
		this.subCategoryId = subCategoryId;
	}

	public int getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public Subcategory getSubcategory() 
	{
		return subcategory;
	}

	public void setSubcategory(Subcategory subcategory) 
	{
		this.subcategory = subcategory;
	}

	public Supplier getSupplier() 
	{
		return supplier;
	}

	public void setSupplier(Supplier supplier) 
	{
		this.supplier = supplier;
	}

	public Category getCategory() 
	{
		return category;
	}

	public void setCategory(Category category) 
	{
		this.category = category;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	

    
  
}
