package com.fashionwardrobe.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fashionwardrobe.dao.WishListDao;
import com.fashionwardrobe.model.WishList;

@Repository
public class WishListDaoImpl implements WishListDao 
{
	@Autowired
	private SessionFactory sessionFactory;
	
	public void createWishList(WishList wishList) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(wishList);	
	}

	@SuppressWarnings("unchecked")
	public List<WishList> wishList(int userId) 
	{
		String sql = "from WishList where userId="+userId;
		List<WishList> list = sessionFactory.getCurrentSession().createQuery(sql).getResultList();
		
			return list;
		
	}

	public void deleteWishList(int wishListId) 
	{
		WishList wishListToDelete=new WishList();
		wishListToDelete.setWishListId(wishListId);
		sessionFactory.getCurrentSession().delete(wishListToDelete);
		
	}
  
}
