package com.fashionwardrobe.model;


import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import org.hibernate.validator.constraints.NotEmpty;
import com.google.gson.annotations.Expose;

@Entity
public class Category {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Expose
    private int categoryId;
	@Expose
	@NotEmpty(message="Category Name Should Not Be Empty")
	private String categoryName;
	@Expose
	@NotEmpty(message="Category Description Should Not Be Empty")
	private String categoryDesc;
	
	@OneToMany(mappedBy="category",fetch=FetchType.EAGER)
	private Set<Subcategory> subCategory;
	
	public Set<Subcategory> getSubCategory() 
	{
		return subCategory;
	}
	public void setSubCategory(Set<Subcategory> subCategory) 
	{
		this.subCategory = subCategory;
	}
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryDesc() {
		return categoryDesc;
	}
	public void setCategoryDesc(String categoryDesc) {
		this.categoryDesc = categoryDesc;
	}
    
	
}
