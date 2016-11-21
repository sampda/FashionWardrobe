package com.fashionwardrobe.dao;

import java.util.List;
import com.fashionwardrobe.model.ProductSpecification;



public interface ProductSpecificationDao 
{
	public void createProductSpecification(ProductSpecification productSpecification);  
	public List<ProductSpecification> listProductSpecification();
	public String stringProductSpecification();
	public ProductSpecification getById(int productId);
	
}
