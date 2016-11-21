package com.fashionwardrobe.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.validator.constraints.NotEmpty;

import com.google.gson.annotations.Expose;

@Entity
public class Subcategory 
{
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Expose
    private int subCategoryId;
	@Expose
	@NotEmpty(message="Subcategory Name Should Not Be Empty")
	private String subCategoryName;
	@Expose
	@NotEmpty(message="Subcategory description Should Not Be Empty")
	private String subCategoryDesc;
	@Expose
	private int categoryId;
	

	@ManyToOne
	@JoinColumn(name="categoryId" ,nullable=false,insertable=false,updatable=false)
	private Category category;
	

	
	
	public int getSubCategoryId() {
		return subCategoryId;
	}

	public void setSubCategoryId(int subCategoryId) {
		this.subCategoryId = subCategoryId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getSubCategoryName() {
		return subCategoryName;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}

	public String getSubCategoryDesc() {
		return subCategoryDesc;
	}

	public void setSubCategoryDesc(String subCategoryDesc) {
		this.subCategoryDesc = subCategoryDesc;
	}
	

}
