package com.fashionwardrobe.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

import com.google.gson.annotations.Expose;

@SuppressWarnings("serial")
@Entity
public class ProductView implements Serializable
{
    @Id
    @Expose
    private int productId;
    @Expose
    private String categoryName;
    @Expose
    private String subCategoryname;
    @Expose
    private String companyName;
    @Expose
    private String companyUrl;
    @Expose
    private String productName;
    @Expose
    private int productPrice;
    @Expose
    private String productDesc;
    @Expose
    private int productQauntity;
    @Expose
    private int productDiscount;
    @Expose
    private Date date;
    @Expose
    private String productBrand;
    @Expose
    private String productColor;
    @Expose
    private String productFabric;
    @Expose
    private String productType;
    @Expose
    private String productSize;
    
    @Expose
    private String productDesign;
    @Expose
    private String productCollar;
    @Expose
    private boolean enabled;
    
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getSubCategoryname() {
		return subCategoryname;
	}
	public void setSubCategoryname(String subCategoryname) {
		this.subCategoryname = subCategoryname;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyUrl() {
		return companyUrl;
	}
	public void setCompanyUrl(String companyUrl) {
		this.companyUrl = companyUrl;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}
	public String getProductColor() {
		return productColor;
	}
	public void setProductColor(String productColor) {
		this.productColor = productColor;
	}
	public String getProductFabric() {
		return productFabric;
	}
	public void setProductFabric(String productFabric) {
		this.productFabric = productFabric;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public String getProductSize() {
		return productSize;
	}
	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}
	
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductQauntity() {
		return productQauntity;
	}
	public void setProductQauntity(int productQauntity) {
		this.productQauntity = productQauntity;
	}
	public int getProductDiscount() {
		return productDiscount;
	}
	public void setProductDiscount(int productDiscount) {
		this.productDiscount = productDiscount;
	}
	
	public String getProductDesign() {
		return productDesign;
	}
	public void setProductDesign(String productDesign) {
		this.productDesign = productDesign;
	}
	public String getProductCollar() {
		return productCollar;
	}
	public void setProductCollar(String productCollar) {
		this.productCollar = productCollar;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	
}
