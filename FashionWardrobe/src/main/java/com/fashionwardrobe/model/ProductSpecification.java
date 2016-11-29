package com.fashionwardrobe.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import com.google.gson.annotations.Expose;

@SuppressWarnings("serial")
@Entity
public class ProductSpecification implements Serializable
{
	@Id
	@Expose
	 private int productId;
	@Expose

	 private String productFabric;
	@Expose
	
	 private String productBrand;
	@Expose

	 private String productColor;
	@Expose
	
	 private String productType;
	@Expose
	
	 private String productSize;
	@Expose
	
	private String productDesign;
	@Expose
	
	private String productWashType;
	@Expose
	
	private String productCollar;

	 @OneToOne
	 @JoinColumn(name="productId" ,nullable=false,insertable=false,updatable=false)
	 private Product product;
	 
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductFabric() {
		return productFabric;
	}
	public void setProductFabric(String productFabric) {
		this.productFabric = productFabric;
	}
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
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
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	
	public String getProductDesign() {
		return productDesign;
	}
	public void setProductDesign(String productDesign) {
		this.productDesign = productDesign;
	}
	public String getProductWashType() {
		return productWashType;
	}
	public void setProductWashType(String productWashType) {
		this.productWashType = productWashType;
	}
	public String getProductCollar() {
		return productCollar;
	}
	public void setProductCollar(String productCollar) {
		this.productCollar = productCollar;
	}
	public String getProductSize() {
		return productSize;
	}
	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}
	 
	
}
