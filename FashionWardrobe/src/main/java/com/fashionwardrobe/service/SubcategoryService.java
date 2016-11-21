package com.fashionwardrobe.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.fashionwardrobe.daoimpl.SubcategoryDaoImpl;
import com.fashionwardrobe.model.Subcategory;

@Service
public class SubcategoryService 
{
	@Autowired
	   private SubcategoryDaoImpl subcategoryDaoImpl;
	   
	   
	@Transactional
		public void addsubCategory(Subcategory subcategory)
		{
			subcategoryDaoImpl.createsubCategory(subcategory);
		}
		
	@Transactional
		public List<Subcategory> listsubCategory() 
		{
		return subcategoryDaoImpl.listsubCategories();
		}
	
	@Transactional
	public Subcategory getsubCatIdByName(String subcategoryName)
	{
		return subcategoryDaoImpl.getsubCatIdByName(subcategoryName);
	}
	
	@Transactional
	public String stringsubCategory()
	{
		return subcategoryDaoImpl.stringsubcategory();
	}
	
	@Transactional
	public Subcategory getSubCatById(int subCategory_id)
	{
		return subcategoryDaoImpl.getSubCatById(subCategory_id);
	}
	
	@Transactional
	public void deleteSubCategory(int subCategory_id)
	{
		subcategoryDaoImpl.deleteSubCategory(subCategory_id);
	}
	
		
}
