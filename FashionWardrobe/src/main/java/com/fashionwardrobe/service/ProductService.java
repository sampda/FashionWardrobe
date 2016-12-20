package com.fashionwardrobe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.fashionwardrobe.daoimpl.ProductDaoImpl;
import com.fashionwardrobe.model.Product;



@Service
public class ProductService 
{
	@Autowired
	   private ProductDaoImpl productDaoImpl;
	   
	   
	@Transactional
		public void addproduct(Product product)
		{
			productDaoImpl.createProduct(product);
		}
		
	@Transactional
		public List<Product> listproduct() 
		{
		return productDaoImpl.listproducts();
		}
	
	@Transactional
	public String stringProduct()
	{
		return productDaoImpl.stringProduct();
	}
	
	@Transactional
	public Product getProductById(int productId)
	{
		return productDaoImpl.getProductById(productId);
	}
	
	@Transactional
	public void deleteProduct(int productId)
	{
		productDaoImpl.deleteProduct(productId);
	}
	
	@Transactional
	public void UpdateProduct(int productId) 
	{
		productDaoImpl.UpdateProduct(productId);
	}
	
	@Transactional
	public String stringProductEnabled()
	{
		return productDaoImpl.stringProductEnabled();
	}
	
	@Transactional
	public void updateProductMinus(int productId,int productQauntity) 
	{
		productDaoImpl.updateProductMinus(productId,productQauntity);
	}
	
	@Transactional
	public void updateProductPlus(int productId,int productQauntity) 
	{
		productDaoImpl.updateProductPlus(productId,productQauntity);
	}
	
	@Transactional
	public List<Product> getProductBySupId(int supplierId)
	{
		return productDaoImpl.getProductIdById(supplierId);
	}
	
	@Transactional
	public String supplierRequest()
	{
		return productDaoImpl.supplierRequest();
	}
}
