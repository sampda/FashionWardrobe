package com.fashionwardrobe.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.fashionwardrobe.dao.ProductSpecificationDao;
import com.fashionwardrobe.model.ProductSpecification;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Repository
public class ProductSpecificationDaoImpl implements ProductSpecificationDao
{
	@Autowired
	private SessionFactory sessionFactory;
	
	public void createProductSpecification(ProductSpecification productSpecification) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(productSpecification);
		
	}

	@SuppressWarnings("unchecked")
	public List<ProductSpecification> listProductSpecification() 
	{
		List<ProductSpecification> productSpecificationList = sessionFactory.getCurrentSession().createQuery("from ProductSpecification").getResultList();
		return productSpecificationList;
	}

	@SuppressWarnings("unchecked")
	public String stringProductSpecification() 
	{
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		List<ProductSpecification> productSpecificationList = sessionFactory.getCurrentSession().createQuery("from ProductSpecification").getResultList();
		String productSpecificationjson= gson.toJson(productSpecificationList);
		return productSpecificationjson;
	}

	@SuppressWarnings("unchecked")
	public ProductSpecification getById(int productId) 
	{
		String sql = "from ProductSpecification where productId= '" +productId+"'";
		List<ProductSpecification> list = sessionFactory.getCurrentSession().createQuery(sql).getResultList();
		if(list!=null && !list.isEmpty())
		{
			return list.get(0);
		}
		else return list.get(0);
	}

}
