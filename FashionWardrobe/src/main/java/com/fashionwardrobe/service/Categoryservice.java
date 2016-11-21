package com.fashionwardrobe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.fashionwardrobe.daoimpl.CategoryDaoImpl;
import com.fashionwardrobe.model.Category;


@Service

public class Categoryservice {
	
	@Autowired
   private CategoryDaoImpl categoryDaoImpl;
   
	@Transactional
	public void addCategory(Category category)
	{
		categoryDaoImpl.createCategory(category);
	}
	
	@Transactional
	public List<Category> listCategory() 
	{
	return categoryDaoImpl.listCategories();
	}
	
	@Transactional
	public String stringCategory()
	{
		return categoryDaoImpl.stringCategory();
	}
	
	@Transactional
	public Category getIdByName(String categoryName)
	{
		return categoryDaoImpl.getIdByName(categoryName);
	}
	
	@Transactional
	public Category getById(int category_id)
	{
		return categoryDaoImpl.getById(category_id);
	}
	
	@Transactional
	public void deleteCategory(int category_id)
	{
		categoryDaoImpl.deleteCategory(category_id);
	}
	
	
}
