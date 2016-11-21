package com.fashionwardrobe.daoimpl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.fashionwardrobe.dao.ProductFullViewDao;
import com.fashionwardrobe.model.ProductView;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Repository
public class ProductFullViewDaoImpl implements ProductFullViewDao
{
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<ProductView> listProductView() 
	{
		List<ProductView> productViewList = sessionFactory.getCurrentSession().createQuery("from ProductView").getResultList();
		return productViewList;
	}

	@SuppressWarnings("unchecked")
	public String stringProductView() 
	{
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		List<ProductView> productViewList = sessionFactory.getCurrentSession().createQuery("from ProductView").getResultList();
		String productViewjson= gson.toJson(productViewList);
		return productViewjson;
	}
	
	@SuppressWarnings("unchecked")
	public ProductView getProductViewById(int productId) 
	{
		String sql = "from ProductView where productId=" +productId;
		List<ProductView> list = sessionFactory.getCurrentSession().createQuery(sql).getResultList();
		if(list!=null && !list.isEmpty())
		{
			return list.get(0);
		}
		else return null;
	}

	@SuppressWarnings("unchecked")
	public String stringProductViewEnabled() 
	{
		
			Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
			List<ProductView> productViewList = sessionFactory.getCurrentSession().createQuery("from ProductView where enabled=true").getResultList();
			String productViewjson= gson.toJson(productViewList);
			return productViewjson;
			
		
	}

}
