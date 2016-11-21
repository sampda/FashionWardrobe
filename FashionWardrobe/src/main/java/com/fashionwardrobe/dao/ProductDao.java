package com.fashionwardrobe.dao;

import java.util.List;
import com.fashionwardrobe.model.Product;


public interface ProductDao 
{
	public void createProduct(Product product);  
	public List<Product> listproducts();
	public String stringProduct();
	public Product getProductById(int productId) ;
	public void deleteProduct(int productId);
	public void UpdateProduct(int productId);
	public String stringProductEnabled();
	public void updateProductMinus(int productId);
	public void updateProductPlus(int productId);
	public List<Product> getProductIdById(int supplierId);
}
