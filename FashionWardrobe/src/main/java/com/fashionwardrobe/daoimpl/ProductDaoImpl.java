package com.fashionwardrobe.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.fashionwardrobe.dao.ProductDao;
import com.fashionwardrobe.model.Product;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Repository
public class ProductDaoImpl implements ProductDao
{
	@Autowired
	private SessionFactory sessionFactory;
	
	public void createProduct(Product product)
	{
		product.setEnabled(false);
		sessionFactory.getCurrentSession().saveOrUpdate(product);
	
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> listproducts() 
	{
		List<Product> productList = sessionFactory.getCurrentSession().createQuery("from Product").getResultList();
		return productList;
	}
	
	@SuppressWarnings("unchecked")
	public String stringProduct()
	{
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		List<Product> productList = sessionFactory.getCurrentSession().createQuery("from Product").getResultList();
		String productjson= gson.toJson(productList);
		return productjson;
		
	}

	@SuppressWarnings("unchecked")
	public String stringProductEnabled()
	{
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		List<Product> productList = sessionFactory.getCurrentSession().createQuery("from Product where enabled=true").getResultList();
		String productjson= gson.toJson(productList);
		return productjson;
		
	}
	
	@SuppressWarnings("unchecked")
	public Product getProductById(int productId) 
	{
		String sql = "from Product where productId=" +productId;
		List<Product> list = sessionFactory.getCurrentSession().createQuery(sql).getResultList();
		if(list!=null && !list.isEmpty())
		{
			return list.get(0);
		}
		else return null;
	}
	

	public void deleteProduct(int productId) 
	{
		Product productToDelete=new Product();
		productToDelete.setProductId(productId);
		sessionFactory.getCurrentSession().delete(productToDelete);
		
		
	}

	public void UpdateProduct(int productId) 
	{
		
		sessionFactory.getCurrentSession().createQuery("update Product set enabled =case when enabled=true then false when enabled=false then true end where productId="+productId ).executeUpdate();
		
	}

	public void updateProductMinus(int productId, int productQauntity) 
	{
		sessionFactory.getCurrentSession().createQuery("update Product set productQauntity = productQauntity - "+productQauntity+" where productId="+productId ).executeUpdate();
		
	}

	public void updateProductPlus(int productId, int productQauntity) 
	{
		sessionFactory.getCurrentSession().createQuery("update Product set productQauntity = productQauntity + "+productQauntity+" where productId="+productId ).executeUpdate();
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> getProductIdById(int supplierId) 
	{
		String query ="from Product where supplierId="+supplierId;
		List<Product> productList = sessionFactory.getCurrentSession().createQuery(query).getResultList();		
		if(productList!=null && !productList.isEmpty())
		{
			return productList;
		}
		else return null;
		
	}

	@SuppressWarnings("unchecked")
	public String supplierRequest() 
	{
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		List<Product> productList = sessionFactory.getCurrentSession().createQuery("from Product where enabled=false").getResultList();
		String requestjson= gson.toJson(productList);
		return requestjson;
		
	}

}
