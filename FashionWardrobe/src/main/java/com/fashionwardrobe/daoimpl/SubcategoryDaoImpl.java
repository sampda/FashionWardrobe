package com.fashionwardrobe.daoimpl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.fashionwardrobe.dao.SubcategoryDao;
import com.fashionwardrobe.model.Subcategory;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Repository
public class SubcategoryDaoImpl implements SubcategoryDao
{
	@Autowired
	private SessionFactory sessionFactory;
	
	public void createsubCategory(Subcategory subcategory)
	{
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(subcategory);
	
	}
	
	@SuppressWarnings("unchecked")
	public List<Subcategory> listsubCategories() 
	{
		List<Subcategory> subcategoryList = sessionFactory.getCurrentSession().createQuery("from Subcategory").getResultList();
		return subcategoryList;
	}
	
	@SuppressWarnings("unchecked")
	public String stringsubcategory()
	{
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		List<Subcategory> subcategoryList = sessionFactory.getCurrentSession().createQuery("from Subcategory").getResultList();
		String subcategoryjson= gson.toJson(subcategoryList);
		return subcategoryjson;
		
	}

	
	@SuppressWarnings("unchecked")
	public Subcategory getsubCatIdByName(String subcategoryName)
	{
		
		String sql = "from Subcategory where subCategoryName= '" +subcategoryName+"'";
		List<Subcategory> list = sessionFactory.getCurrentSession().createQuery(sql).getResultList();
		if(list!=null && !list.isEmpty())
		{
			return list.get(0);
		}
		else return null;
	}

	public void deleteSubCategory(int subCategoryId) 
	{
		Subcategory subcategoryToDelete=new Subcategory();
		subcategoryToDelete.setSubCategoryId(subCategoryId);
		sessionFactory.getCurrentSession().delete(subcategoryToDelete);
		
	}

	@SuppressWarnings("unchecked")
	public Subcategory getSubCatById(int subCategoryId) 
	{
		String sql = "from Subcategory where subCategoryId=" +subCategoryId;
		List<Subcategory> list = sessionFactory.getCurrentSession().createQuery(sql).getResultList();
		if(list!=null && !list.isEmpty())
		{
			return list.get(0);
		}
		else return null;
	}
	
	
}
