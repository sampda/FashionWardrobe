package com.fashionwardrobe.dao;

import java.util.List;

import com.fashionwardrobe.model.Subcategory;


public interface SubcategoryDao 
{
	public void createsubCategory(Subcategory subcategory);  
	public List<Subcategory> listsubCategories();
	public String stringsubcategory();
	public Subcategory getsubCatIdByName(String subcategoryName);
	public void deleteSubCategory(int subCategoryId);
	public Subcategory getSubCatById(int subCategoryId);
}
