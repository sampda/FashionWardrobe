package com.fashionwardrobe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.fashionwardrobe.daoimpl.ProductSpecificationDaoImpl;
import com.fashionwardrobe.model.ProductSpecification;



@Service
public class ProductSpecificationService 
{
	@Autowired
	   private ProductSpecificationDaoImpl productSpecificationDaoImpl;
	   
	   
	@Transactional
		public void addProductSpecification(ProductSpecification productSpecification)
		{
		   productSpecificationDaoImpl.createProductSpecification(productSpecification);
		}
		
	@Transactional
		public List<ProductSpecification> listProductSpecification() 
		{
		return productSpecificationDaoImpl.listProductSpecification();
		}
	
	@Transactional
	public String stringProductSpecification() 
	{
		return productSpecificationDaoImpl.stringProductSpecification();
	}
	
	@Transactional
	public ProductSpecification getById(int product_id) 
	{
		return productSpecificationDaoImpl.getById(product_id);
	}
	
}
