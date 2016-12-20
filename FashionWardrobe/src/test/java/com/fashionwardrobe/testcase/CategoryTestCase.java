package com.fashionwardrobe.testcase;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.fashionwardrobe.dao.CategoryDao;
import com.fashionwardrobe.model.Category;

public class CategoryTestCase 
{
	@Autowired
	AnnotationConfigApplicationContext context;
	
	@Autowired
	SessionFactory sessionFactory; 
	
	@Autowired
	Category category;
	
	@Autowired
	CategoryDao categoryDao;
	
	@BeforeClass
    public void test()
    {
    	context = new AnnotationConfigApplicationContext();
    	context.scan("com.fashionwardrobe");
    	context.refresh();
    	
    	Category category = (Category) context.getBean("category");
    	
    	CategoryDao categoryDao = (CategoryDao) context.getBean("categoryDao");
    }
    
	@Test
    public void createCategoyrTestCase()
    {
    	category.setCategoryId(100);
    	category.setCategoryName("Makeup");
    	category.setCategoryDesc("women section");
    	
    	categoryDao.createCategory(category);;
    	
    	Boolean status = categoryDao.createCategory(category);
    	Assert.assertEquals("create Category test case", true, status);
    	
    }
	
	@Transactional
	public boolean createCategory(Category category)
	{
		try
		{
			sessionFactory.getCurrentSession().save(category);
			return true;
		}
		catch(HibernateException e)
		{
			e.printStackTrace();
			return false;
		}
	}
	
	
}
