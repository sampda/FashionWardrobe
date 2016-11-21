package com.fashionwardrobe.dao;

import java.util.List;

import com.fashionwardrobe.model.Category;

public interface CategoryDao 
{
	public void createCategory(Category category);
	public List<Category> listCategories();
	public String stringCategory();
	public Category getIdByName(String categoryName);
	public void deleteCategory(int categoryId);
	public Category getById(int categoryId);
}
